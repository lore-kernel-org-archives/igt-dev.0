Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Mar 2023 16:11:54 -0000
Message-ID: <167820551444.31453.5372220453571527822@emeril.freedesktop.org>
References: <20230307152130.795989-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307152130.795989-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?nitial_Xe_test_suite_=28rev5=29?=
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

Series: Initial Xe test suite (rev5)
URL   : https://patchwork.freedesktop.org/series/112191/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/824003 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/37627676):
  ../tests/xe/xe_vm.c:1570:2: note: in expansion of macro ‘igt_subtest_f’
    igt_subtest_f("mixed-userptr-binds-%ld", bind_size)
    ^~~~~~~~~~~~~
  ../tests/xe/xe_vm.c:1578:16: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_subtest_f("mixed-userptr-misaligned-binds-%ld", bind_size)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~
  ../lib/igt_core.h:242:9: note: in definition of macro ‘__igt_subtest_f’
           format), \
           ^~~~~~
  ../tests/xe/xe_vm.c:1578:2: note: in expansion of macro ‘igt_subtest_f’
    igt_subtest_f("mixed-userptr-misaligned-binds-%ld", bind_size)
    ^~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678205239:step_script
  section_start:1678205239:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678205240:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/37627678):
  ../tests/xe/xe_vm.c:1570:2: note: in expansion of macro ‘igt_subtest_f’
    igt_subtest_f("mixed-userptr-binds-%ld", bind_size)
    ^~~~~~~~~~~~~
  ../tests/xe/xe_vm.c:1578:16: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_subtest_f("mixed-userptr-misaligned-binds-%ld", bind_size)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~
  ../lib/igt_core.h:242:9: note: in definition of macro ‘__igt_subtest_f’
           format), \
           ^~~~~~
  ../tests/xe/xe_vm.c:1578:2: note: in expansion of macro ‘igt_subtest_f’
    igt_subtest_f("mixed-userptr-misaligned-binds-%ld", bind_size)
    ^~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678205405:step_script
  section_start:1678205405:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678205406:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/824003
