Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Mon, 25 Sep 2023 19:10:42 -0000
Message-ID: <169566904296.21533.14442367794451735235@emeril.freedesktop.org>
References: <20230925143154.4055120-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230925143154.4055120-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?ntel/i915=5Fquery=3A_Add_query-l3-bank-count_subtest_=28rev2=29?=
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

Series: intel/i915_query: Add query-l3-bank-count subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/124121/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/994197 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49441907):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out abb34bca as detached HEAD (ref is intel/IGTPW_9865)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing meson-test-list.txt
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1695668758:get_sources
  section_start:1695668758:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-abb34bca38252d3c5496e35e65de82114d3946db with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...
  section_end:1695668759:step_script
  section_start:1695668759:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695668760:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b: image not known (docker.go:570:0s)

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49441902):
  section_start:1695668755:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out abb34bca as detached HEAD (ref is intel/IGTPW_9865)...
  
  Skipping Git submodules setup
  section_end:1695668758:get_sources
  section_start:1695668758:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-abb34bca38252d3c5496e35e65de82114d3946db with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1695668759:step_script
  section_start:1695668759:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695668760:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/994197
