Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 15:12:38 -0000
Message-ID: <158990115837.31236.14614918313555906091@emeril.freedesktop.org>
References: <20200519125956.13206-1-imre.deak@intel.com>
In-Reply-To: <20200519125956.13206-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fflip=3A_Keep_signal_helpers_enabled_after_a_failed_i?=
 =?utf-8?q?nterruptible_subtest?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip: Keep signal helpers enabled after a failed interruptible subtest
URL   : https://patchwork.freedesktop.org/series/77411/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/148630 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2740206):
    CC       i915/i915_perf_metrics_kblgt2.lo
    CC       i915/i915_perf_registers_kblgt2.lo
  i915/i915_perf_registers_kblgt2.c:1734:1: fatal error: error writing to /tmp/cc0dQ9kb.s: No space left on device
   }
   ^
  compilation terminated.
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/lib'
  make[3]: *** [Makefile:1208: i915/i915_perf_registers_kblgt2.lo] Error 1
  make[2]: *** [Makefile:824: all] Error 2
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/lib'
  make[1]: *** [Makefile:515: all-recursive] Error 1
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make: *** [Makefile:447: all] Error 2
  section_end:1589900848:build_script
  section_start:1589900848:after_script
  section_end:1589900850:after_script
  section_start:1589900850:upload_artifacts_on_failure
  section_end:1589900852:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/148630
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
