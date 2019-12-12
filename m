Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 15:40:00 -0000
Message-ID: <157616520075.32010.2817342128986079523@emeril.freedesktop.org>
References: <20191212142415.26517-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212142415.26517-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_i915_pipe_stress_test_=28rev2=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce i915 pipe stress test (rev2)
URL   : https://patchwork.freedesktop.org/series/70815/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88172 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1133323):
    CCLD     i915_getparams_basic
    CCLD     i915_hangman
    CCLD     i915_module_load
    CCLD     i915_pm_backlight
    CCLD     i915_pm_lpsp
    CCLD     i915_pm_rc6_residency
  make[3]: *** No rule to make target 'i915_pipe_stress.c', needed by 'i915_pipe_stress.o'.  Stop.
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[2]: *** [Makefile:5280: all-recursive] Error 1
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make[1]: *** [Makefile:514: all-recursive] Error 1
  make: *** [Makefile:446: all] Error 2
  section_end:1576164934:build_script
  [0Ksection_start:1576164934:after_script
  [0Ksection_end:1576164935:after_script
  [0Ksection_start:1576164935:upload_artifacts_on_failure
  [0Ksection_end:1576164936:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88172
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
