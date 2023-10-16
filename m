Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Mon, 16 Oct 2023 19:00:46 -0000
Message-ID: <169748284681.13508.11236357071869401898@emeril.freedesktop.org>
References: <20231016134852.413678-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231016134852.413678-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Ffb/xe=3A_use_engine_copy_where_available?=
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

Series: lib/igt_fb/xe: use engine copy where available
URL   : https://patchwork.freedesktop.org/series/125171/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1011688 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50388795):
  section_start:1697482376:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out ddee4256 as detached HEAD (ref is intel/IGTPW_10005)...
  
  Skipping Git submodules setup
  section_end:1697482380:get_sources
  section_start:1697482380:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-ddee425652b1661aef59053dd06d82a67598c404 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  section_end:1697482382:step_script
  section_start:1697482382:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1697482383:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8: image not known (docker.go:570:0s)

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50388797):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out ddee4256 as detached HEAD (ref is intel/IGTPW_10005)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1697482380:get_sources
  section_start:1697482380:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-ddee425652b1661aef59053dd06d82a67598c404 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1697482382:step_script
  section_start:1697482382:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1697482383:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1011688
