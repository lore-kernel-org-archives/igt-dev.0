Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Jan 2022 13:52:15 -0000
Message-ID: <164190913598.24977.12445700517844223112@emeril.freedesktop.org>
References: <20220111120153.2920064-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20220111120153.2920064-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fuserptr=5Fblits=3A_Skip_sd-probe_test_for_discr?=
 =?utf-8?q?ete_platforms_=28rev3=29?=
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
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_userptr_blits: Skip sd-probe test for discrete platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/98615/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/481364 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17477186):
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1641905708:prepare_executor
  section_start:1641905708:prepare_script
  Preparing environment
  Running on runner-thys1ka2-project-3185-concurrent-0 via gst-htz-2...
  section_end:1641905708:prepare_script
  section_start:1641905708:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641907509:get_sources
  section_start:1641907509:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1641907509:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17477188):
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1641905756:prepare_executor
  section_start:1641905756:prepare_script
  Preparing environment
  Running on runner-ya9tm6yf-project-3185-concurrent-1 via fdo-packet-m1xl-2...
  section_end:1641905760:prepare_script
  section_start:1641905760:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641907562:get_sources
  section_start:1641907562:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641907563:cleanup_file_variables
  ERROR: Job failed: exit code 1

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17477187):
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1641905722:prepare_executor
  section_start:1641905722:prepare_script
  Preparing environment
  Running on runner-ya9tm6yf-project-3185-concurrent-0 via fdo-packet-m1xl-2...
  section_end:1641905724:prepare_script
  section_start:1641905724:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641907526:get_sources
  section_start:1641907526:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641907527:cleanup_file_variables
  ERROR: Job failed: exit code 1

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/17477190):
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1641907213:prepare_executor
  section_start:1641907213:prepare_script
  Preparing environment
  Running on runner-zbmz6-qr-project-3185-concurrent-0 via fdo-packet-m1xl-1...
  section_end:1641907214:prepare_script
  section_start:1641907214:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': The requested URL returned error: 504
  section_end:1641909024:get_sources
  section_start:1641909024:cleanup_file_variables
  Cleaning up file based variables
  section_end:1641909027:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/481364
