Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Dec 2019 00:34:01 -0000
Message-ID: <157680204100.9212.5838417878014707556@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test
URL   : https://patchwork.freedesktop.org/series/71194/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/91026 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1208859):
    CCLD     gem_largeobject
    CCLD     gem_linear_blits
    CCLD     gem_lut_handle
    CCLD     gem_madvise
    CCLD     gem_media_fill
    CCLD     gem_media_vme
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[3]: *** No rule to make target 'gem_huc_copy.c', needed by 'gem_huc_copy.o'.  Stop.
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[2]: *** [Makefile:5280: all-recursive] Error 1
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make[1]: *** [Makefile:514: all-recursive] Error 1
  make: *** [Makefile:446: all] Error 2
  section_end:1576801970:build_script
  [0Ksection_start:1576801970:after_script
  [0Ksection_end:1576801972:after_script
  [0Ksection_start:1576801972:upload_artifacts_on_failure
  [0Ksection_end:1576801973:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/91026
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
