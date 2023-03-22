Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Mar 2023 06:57:51 -0000
Message-ID: <167946827194.13423.8429057057323563603@emeril.freedesktop.org>
References: <20230322065003.1758611-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230322065003.1758611-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_B?=
 =?utf-8?q?uild_Xe_test_documentation_=28rev3=29?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Build Xe test documentation (rev3)
URL   : https://patchwork.freedesktop.org/series/115373/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/835439 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38527580):
  Installing /builds/gfx-ci/igt-ci-tags/tests/intel-ci/README to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/share/igt-gpu-tools
  Installing /builds/gfx-ci/igt-ci-tags/tests/intel-ci/blacklist.txt to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/share/igt-gpu-tools
  Installing /builds/gfx-ci/igt-ci-tags/tests/intel-ci/blacklist-pre-merge.txt to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/share/igt-gpu-tools
  Installing /builds/gfx-ci/igt-ci-tags/tests/intel-ci/xe-fast-feedback.testlist to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/share/igt-gpu-tools
  Installing /builds/gfx-ci/igt-ci-tags/tools/intel_gpu_abrt to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/bin
  Installing /builds/gfx-ci/igt-ci-tags/build/assembler/intel-gen4asm.pc to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/lib64/pkgconfig
  Installing /builds/gfx-ci/igt-ci-tags/scripts/code_cov_capture to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/bin
  Installing /builds/gfx-ci/igt-ci-tags/scripts/code_cov_gather_on_build to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/bin
  Installing /builds/gfx-ci/igt-ci-tags/scripts/code_cov_gather_on_test to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/bin
  Installing /builds/gfx-ci/igt-ci-tags/scripts/code_cov_gen_report to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/bin
  Installing /builds/gfx-ci/igt-ci-tags/scripts/code_cov_parse_info to /builds/gfx-ci/igt-ci-tags/installdir/opt/igt/bin
  $ ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
  ninja: Entering directory `build'
  ninja: error: unknown target 'igt-gpu-tools-doc'
  section_end:1679468075:step_script
  section_start:1679468075:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679468076:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38527582):
  [1332/1342] Compiling C object 'lib/lib@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt3.c.o'.
  [1333/1342] Linking target lib/libi915_perf.so.1.5.
  [1334/1342] Generating symbol file 'lib/lib@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [1335/1342] Linking target tools/i915-perf/i915-perf-configs.
  [1336/1342] Linking target tools/i915-perf/i915-perf-recorder.
  [1337/1342] Linking target tools/i915-perf/i915-perf-reader.
  [1338/1342] Linking target tests/core_hotunplug.
  [1339/1342] Linking target tests/gem_barrier_race.
  [1340/1342] Linking target tests/perf.
  [1341/1342] Generating xe_tests.rst with a custom command.
  [1342/1342] Generating xe_tests.html with a custom command.
  $ ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
  ninja: Entering directory `build'
  ninja: error: unknown target 'igt-gpu-tools-doc'
  section_end:1679468072:step_script
  section_start:1679468072:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679468073:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/835439

