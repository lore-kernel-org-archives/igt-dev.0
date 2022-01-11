Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Jan 2022 17:57:54 -0000
Message-ID: <164192387444.24978.18334176275348437508@emeril.freedesktop.org>
References: <20220111165600.6999-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20220111165600.6999-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fsync=3A_Add_support_for_local_memory_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync: Add support for local memory (rev3)
URL   : https://patchwork.freedesktop.org/series/95437/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/481560 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17488613):
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1641921629:prepare_executor
  section_start:1641921629:prepare_script
  Preparing environment
  Running on runner-zbmz6-qr-project-3185-concurrent-0 via fdo-packet-m1xl-1...
  section_end:1641921632:prepare_script
  section_start:1641921632:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641923434:get_sources
  section_start:1641923434:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641923435:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17488614):
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1641921834:prepare_executor
  section_start:1641921834:prepare_script
  Preparing environment
  Running on runner-lb3m2qse-project-3185-concurrent-2 via fdo-packet-m1xl-3...
  section_end:1641921837:prepare_script
  section_start:1641921837:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641923640:get_sources
  section_start:1641923640:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641923642:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/481560
