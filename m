Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Mar 2023 21:38:01 -0000
Message-ID: <167822508118.31450.2528898782980470885@emeril.freedesktop.org>
References: <20230307211818.910093-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307211818.910093-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?nitial_Xe_test_suite_=28rev6=29?=
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

Series: Initial Xe test suite (rev6)
URL   : https://patchwork.freedesktop.org/series/112191/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/824260 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/37651508):
                   from ../lib/igt.h:27,
                   from ../tests/xe/xe_vm.c:6:
  ../tests/xe/xe_vm.c: In function ‘__igt_unique____real_main1329’:
  ../tests/xe/xe_vm.c:1537:16: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_subtest_f("mixed-misaligned-binds-%ld", bind_size)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~
  ../lib/igt_core.h:242:9: note: in definition of macro ‘__igt_subtest_f’
           format), \
           ^~~~~~
  ../tests/xe/xe_vm.c:1537:2: note: in expansion of macro ‘igt_subtest_f’
    igt_subtest_f("mixed-misaligned-binds-%ld", bind_size)
    ^~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678224753:step_script
  section_start:1678224753:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678224754:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/37651510):
                   from ../lib/igt.h:27,
                   from ../tests/xe/xe_vm.c:6:
  ../tests/xe/xe_vm.c: In function ‘__igt_unique____real_main1329’:
  ../tests/xe/xe_vm.c:1537:16: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_subtest_f("mixed-misaligned-binds-%ld", bind_size)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~
  ../lib/igt_core.h:242:9: note: in definition of macro ‘__igt_subtest_f’
           format), \
           ^~~~~~
  ../tests/xe/xe_vm.c:1537:2: note: in expansion of macro ‘igt_subtest_f’
    igt_subtest_f("mixed-misaligned-binds-%ld", bind_size)
    ^~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678224861:step_script
  section_start:1678224861:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678224861:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/824260
