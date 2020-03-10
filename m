Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Mar 2020 16:40:34 -0000
Message-ID: <158385843456.24168.10696569933346641286@emeril.freedesktop.org>
References: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/perf=3A_remove_g?=
 =?utf-8?q?eneration_code_for_mathml_render?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/perf: remove generation code for mathml render
URL   : https://patchwork.freedesktop.org/series/74528/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118228 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1891147):
  make[3]: Entering directory '/builds/gfx-ci/igt-ci-tags/lib'
    CC       i915/perf.lo
  i915/perf.c:41:10: fatal error: i915_perf_metrics_hsw.h: No such file or directory
   #include "i915_perf_metrics_hsw.h"
            ^~~~~~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/lib'
  make[3]: *** [Makefile:929: i915/perf.lo] Error 1
  make[2]: *** [Makefile:685: all] Error 2
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/lib'
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make[1]: *** [Makefile:515: all-recursive] Error 1
  make: *** [Makefile:447: all] Error 2
  section_end:1583858259:build_script
  section_start:1583858259:after_script
  section_end:1583858261:after_script
  section_start:1583858261:upload_artifacts_on_failure
  section_end:1583858263:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118228
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
