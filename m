Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 13:19:08 -0000
Message-ID: <157615674839.32010.9843824229746038996@emeril.freedesktop.org>
References: <20191212123301.23827-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212123301.23827-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?gt/tests=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28re?=
 =?utf-8?q?v21=29?=
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

Series: igt/tests: kms_plane_stress: Add plane stress test (rev21)
URL   : https://patchwork.freedesktop.org/series/58524/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88114 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1131933):
    CCLD     kms_plane_alpha_blend
    CCLD     kms_plane_cursor
    CCLD     kms_plane_lowres
    CCLD     kms_plane_multiple
    CCLD     kms_plane_scaling
    CCLD     kms_prime
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[3]: *** No rule to make target 'kms_plane_stress.c', needed by 'kms_plane_stress.o'.  Stop.
  make[2]: *** [Makefile:5281: all-recursive] Error 1
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[1]: *** [Makefile:514: all-recursive] Error 1
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make: *** [Makefile:446: all] Error 2
  section_end:1576156563:build_script
  [0Ksection_start:1576156563:after_script
  [0Ksection_end:1576156564:after_script
  [0Ksection_start:1576156564:upload_artifacts_on_failure
  [0Ksection_end:1576156566:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88114
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
