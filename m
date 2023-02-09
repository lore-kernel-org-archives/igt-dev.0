Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 09 Feb 2023 06:35:15 -0000
Message-ID: <167592451519.20201.13857092389623490121@emeril.freedesktop.org>
References: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fatomic=5Ftran?=
 =?utf-8?q?sition=3A_Reduce_the_execution_time_on_simulation?=
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

Series: series starting with [i-g-t,1/2] tests/kms_atomic_transition: Reduce the execution time on simulation
URL   : https://patchwork.freedesktop.org/series/113813/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/804084 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/36114689):
  [512/523] Linking target tools/null_state_gen/intel_null_state_gen.
  [513/523] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gpu_top.c.o'.
  [514/523] Linking target tools/intel_gpu_top.
  [515/523] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt1.c.o'.
  [516/523] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
  [517/523] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt2.c.o'.
  [518/523] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt3.c.o'.
  [519/523] Linking target lib/libi915_perf.so.1.5.
  [520/523] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [521/523] Linking target tools/i915-perf/i915-perf-configs.
  [522/523] Linking target tools/i915-perf/i915-perf-recorder.
  [523/523] Linking target tools/i915-perf/i915-perf-reader.
  section_end:1675924312:step_script
  section_start:1675924312:upload_artifacts_on_success
  Uploading artifacts for successful job
  section_end:1675924313:upload_artifacts_on_success
  section_start:1675924313:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675924313:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: container create: allocating lock for new container: allocation failed; exceeded num_locks (2048) (docker.go:534:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/804084
