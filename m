Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Mon, 05 Jun 2023 17:44:55 -0000
Message-ID: <168598709535.24739.8433940485988930740@emeril.freedesktop.org>
References: <20230605055059.2942855-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230605055059.2942855-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/1=5D_Uevent_listener_for_fake_?=
 =?utf-8?q?gt_reset_failure=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/1] Uevent listener for fake gt reset failure.
URL   : https://patchwork.freedesktop.org/series/118877/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/899899 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43122298):
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 ...
  Using docker image sha256:f30fc6cc2c3a3c5f3ae052ef95ae06faaf8878f0f9f58ddad81986525d03775e for registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 with digest registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper@sha256:bb764179fa955138995229ea5deeaa77d171aa4bcc10e0f0b0233b1f2e1eb1c2 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 ...
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1685986918:prepare_executor
  section_start:1685986918:prepare_script
  Preparing environment
  Running on runner-yyhtcik-project-3185-concurrent-3 via 650f0182b086...
  section_end:1685986919:prepare_script
  section_start:1685986919:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  /bin/bash: line 142: /host/bin/curl: cannot execute binary file: Exec format error
  section_end:1685986920:get_sources
  section_start:1685986920:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685986921:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43122290):
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 ...
  Using docker image sha256:f30fc6cc2c3a3c5f3ae052ef95ae06faaf8878f0f9f58ddad81986525d03775e for registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 with digest registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper@sha256:bb764179fa955138995229ea5deeaa77d171aa4bcc10e0f0b0233b1f2e1eb1c2 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1685986918:prepare_executor
  section_start:1685986918:prepare_script
  Preparing environment
  Running on runner-yyhtcik-project-3185-concurrent-0 via 650f0182b086...
  section_end:1685986919:prepare_script
  section_start:1685986919:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  /bin/bash: line 142: /host/bin/curl: cannot execute binary file: Exec format error
  section_end:1685986920:get_sources
  section_start:1685986920:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685986921:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43122294):
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 ...
  Using docker image sha256:f30fc6cc2c3a3c5f3ae052ef95ae06faaf8878f0f9f58ddad81986525d03775e for registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 with digest registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper@sha256:bb764179fa955138995229ea5deeaa77d171aa4bcc10e0f0b0233b1f2e1eb1c2 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1685986918:prepare_executor
  section_start:1685986918:prepare_script
  Preparing environment
  Running on runner-yyhtcik-project-3185-concurrent-2 via 650f0182b086...
  section_end:1685986919:prepare_script
  section_start:1685986919:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  /bin/bash: line 143: /host/bin/curl: cannot execute binary file: Exec format error
  section_end:1685986920:get_sources
  section_start:1685986920:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685986921:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43122292):
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 ...
  Using docker image sha256:f30fc6cc2c3a3c5f3ae052ef95ae06faaf8878f0f9f58ddad81986525d03775e for registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-79704081 with digest registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper@sha256:bb764179fa955138995229ea5deeaa77d171aa4bcc10e0f0b0233b1f2e1eb1c2 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4a5ace7cbaa36ee552040e9e7f3fcbc60dbd13f7 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1685986918:prepare_executor
  section_start:1685986918:prepare_script
  Preparing environment
  Running on runner-yyhtcik-project-3185-concurrent-1 via 650f0182b086...
  section_end:1685986919:prepare_script
  section_start:1685986919:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  /bin/bash: line 142: /host/bin/curl: cannot execute binary file: Exec format error
  section_end:1685986920:get_sources
  section_start:1685986920:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685986921:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/899899
