local go_runtime(version, arch) = {
  type: 'pod',
  arch: arch,
  containers: [
    {
      image: 'golang:' + version + '-buster',
    },
  ],
};

local steps_gitsrc() = [
  { type: 'restore_cache', keys: ['cache-repo-clone'], dest_dir: '.' }, //restore, next step clone: if exist then just fetch/pull, not full clone
  { type: 'clone' },
  { type: 'save_to_workspace', contents: [{ source_dir: '.', dest_dir: './clone', paths: ['**'] }] },
  { type: 'save_cache', key: 'cache-repo-clone', contents: [{ source_dir: '.' }] },
];
//
local cmd()='cd clone && make';
local steps_go() = [
  //{ type: 'clone' },
  { type: 'restore_workspace', dest_dir: '.' },
  { type: 'restore_cache', keys: ['cache-sum-{{ md5sum "clone/go.sum" }}', 'cache-data-agola-gw'], dest_dir: '/go/pkg/mod/cache' },
  { type: 'run', name: 'go build', command: cmd() },
  { type: 'save_to_workspace', contents: [{ source_dir: './clone/bin', dest_dir: './target_go', paths: ['**'] }] },
  { type: 'save_cache', key: 'cache-sum-{{ md5sum "clone/go.sum" }}', contents: [{ source_dir: '/go/pkg/mod/cache' }] },
  { type: 'save_cache', key: 'cache-data-agola-gw', contents: [{ source_dir: '/go/pkg/mod/cache' }] },
];

local steps_docker() = [
  { type: 'restore_workspace', dest_dir: '.' },
  // { type: 'run', name: 'bh build', command: 'cd target_go && tree -h -L 2 && bh $vfs bud -t $REPO_URL/$REPO_NS/agola-gw:latest .' },
  // { type: 'run', name: 'bh push', command: 'echo "${REPO_PASS}" |bh login --username=${REPO_USER} --password-stdin $REPO_URL && bh push $REPO_URL/$REPO_NS/agola-gw:latest' },
];

local cmd='cd t-deployr-deployments/dcp/agola-gw/ && dr run -target root@aa.ten.devcn.fun:22 -identity $(pwd)/../../sec/id_rsa';
local steps_deployr() = [
  { type: 'run', command: 'dr help run' },
  { type: 'run', name: 'clone', command: 'git clone http://sam:${GIT_PASS}@git.ali.devcn.fun:81/g-dev1/t-deployr-deployments' },
  { type: 'run', name: 'tree', command: 'tree t-deployr-deployments' },
  // { type: 'run', name: 'dr run', command: cmd },
];


local task_gitsrc() = {
    name: 'git-src',
    runtime: {
      arch: 'amd64',
      containers: [{image: 'registry.cn-shenzhen.aliyuncs.com/sam-ns1/trans-alpine-git:latest'}],
    },
    steps: steps_gitsrc(),
    depends: [],
};

local task_build_go(version, arch) = {
  name: 'build-go' + version + '-' + arch,
  runtime: {
    type: 'pod',
    arch: arch,
    containers: [
      { image: 'golang:' + version + '-buster' },
    ],
  },
  environment: {
    GO111MODULE: 'on',
    GOPROXY: 'https://goproxy.cn',
  },
  steps: steps_go(),
  depends: ['git-src'],
};

local task_docker() = {
  name: 'build-docker-image',
  runtime: {
    arch: 'amd64',
    containers: [
      {
        //execService: allowPrivilegedContainers: true
        privileged: true,
        image: 'registry.cn-shenzhen.aliyuncs.com/k-spe/dvp-buildah:v3',
        volumes: [
          { path: '/var/lib/containers', tmpfs: {size: '5120Mi'} },
          { path: '/run/containers', tmpfs: {} },
        ],               
      },
    ],
  },
  shell: '/bin/bash',
  working_dir: '/workspace',
  environment: {
    REPO_URL:  { from_variable: 'registry.cn-shenzhen.aliyuncs.com' },
    REPO_NS:   'demo1-app',
    REPO_USER: { from_variable: 'repo1_user' },
    REPO_PASS: { from_variable: 'repo1_pass' },
  },
  steps: steps_docker(),
  depends: ['build-go1.13-amd64'],
};

local task_deployr() = {
  name: 'deployr',
  runtime: {
    arch: 'amd64',
    containers: [
      {
        //privileged: true,
        image: 'registry.cn-shenzhen.aliyuncs.com/k-pub/deployr:latest',              
      },
    ],
  },
  shell: '/bin/bash',
  working_dir: '/workspace',
  environment: {
    GIT_URL:  { from_variable: 'git1_url' },
    GIT_USER: { from_variable: 'git1_pass' },
    GIT_PASS: { from_variable: 'git1_pass' },
  },
  steps: steps_deployr(),
  depends: ['build-docker-image'],
};

local task_build_go00(version, arch) = {
  name: 'build go ' + version + ' ' + arch,
  runtime: go_runtime(version, arch),
  environment: {
    GO111MODULE: 'on',
    GOPROXY: 'https://goproxy.cn',
  },
  steps: [
    { type: 'clone' },
    { type: 'restore_cache', keys: ['cache-sum-{{ md5sum "go.sum" }}', 'cache-date-'], dest_dir: '/go/pkg/mod/cache' },
    { type: 'run', command: 'make' },
    { type: 'save_cache', key: 'cache-sum-{{ md5sum "go.sum" }}', contents: [{ source_dir: '/go/pkg/mod/cache' }] },
    { type: 'save_cache', key: 'cache-date-{{ year }}-{{ month }}-{{ day }}', contents: [{ source_dir: '/go/pkg/mod/cache' }] },
    // { type: 'run', name: 'install golangci-lint', command: 'curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $(go env GOPATH)/bin v1.21.0' },
    // { type: 'run', command: 'golangci-lint run --deadline 5m' },
    // { type: 'run', name: 'build docker/k8s drivers tests binary', command: 'CGO_ENABLED=0 go test -c ./internal/services/executor/driver -o ./bin/docker-tests' },
    // { type: 'run', name: 'build integration tests binary', command: 'go test -tags "sqlite_unlock_notify" -c ./tests -o ./bin/integration-tests' },
    // { type: 'run', name: 'run tests', command: 'SKIP_DOCKER_TESTS=1 SKIP_K8S_TESTS=1 go test -v -count 1 $(go list ./... | grep -v /tests)' },
    // { type: 'run', name: 'fetch gitea binary for integration tests', command: 'curl -L https://github.com/go-gitea/gitea/releases/download/v1.8.3/gitea-1.8.3-linux-amd64 -o ./bin/gitea && chmod +x ./bin/gitea' },
    { type: 'save_to_workspace', contents: [{ source_dir: './bin', dest_dir: '/bin/', paths: ['*'] }] },
  ],
};




{
  runs: [
    {
      name: 'agola build/test',
      tasks: [
          task_build_go('1.13', 'amd64'),
        
          task_gitsrc(), 
          task_docker(),
          task_deployr(),
        // task_build_push_images('test build docker "agola" image', 'agola', false) + {
        //   when: {
        //     branch: '#.*#',
        //     ref: '#refs/pull/\\d+/head#',
        //   },
        // },
        
        // task_build_push_images('build and push docker "agola" image', 'agola', true) + {
        //   when: {
        //     tag: '#v.*#',
        //   },
        // },
        
      ],
    },
  ],
}
