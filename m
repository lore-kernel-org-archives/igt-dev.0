Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Mar 2023 10:34:14 -0000
Message-ID: <167939485442.18676.9903553674396557560@emeril.freedesktop.org>
References: <20230321092205.1640976-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230321092205.1640976-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_B?=
 =?utf-8?q?uild_Xe_test_documentation_=28rev2=29?=
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

Series: Build Xe test documentation (rev2)
URL   : https://patchwork.freedesktop.org/series/115373/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/834746 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38460573):
  $ /host/bin/curl --cacert /host/ca-certificates.crt -s -L --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out b7f294da as detached HEAD (ref is intel/IGTPW_8651)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  
  Skipping Git submodules setup
  section_end:1679394241:get_sources
  section_start:1679394241:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-b7f294da185926095640251037ca335460891f46 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  section_end:1679394242:step_script
  section_start:1679394242:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679394243:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: container 82a6ca174992ce1b49f3d40074619cd3190d42c7d2b43e019c11fb7349e0ff8a does not exist in database: no such container (exec.go:78:0s)

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38460572):
  Configuring defs.rst using configuration
  Program rst2man-3 found: NO
  Program rst2man found: NO
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index found: YES (/builds/gfx-ci/igt-ci-tags/scripts/gen_rst_index)
  Program sphinx-build found: NO
  Program rst2html-3 found: NO
  Program rst2html found: NO
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:9:0: ERROR:  Unknown variable "xe_test_config".
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1679394225:step_script
  section_start:1679394225:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679394225:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38460566):
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
  section_end:1679394335:step_script
  section_start:1679394335:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679394337:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38460568):
  [1332/1342] Compiling C object 'lib/lib@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt3.c.o'.
  [1333/1342] Linking target lib/libi915_perf.so.1.5.
  [1334/1342] Generating symbol file 'lib/lib@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [1335/1342] Linking target tools/i915-perf/i915-perf-configs.
  [1336/1342] Linking target tools/i915-perf/i915-perf-recorder.
  [1337/1342] Linking target tests/core_hotunplug.
  [1338/1342] Linking target tools/i915-perf/i915-perf-reader.
  [1339/1342] Linking target tests/perf.
  [1340/1342] Linking target tests/gem_barrier_race.
  [1341/1342] Generating xe_tests.rst with a custom command.
  [1342/1342] Generating xe_tests.html with a custom command.
  $ ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
  ninja: Entering directory `build'
  ninja: error: unknown target 'igt-gpu-tools-doc'
  section_end:1679394338:step_script
  section_start:1679394338:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1679394339:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/834746

