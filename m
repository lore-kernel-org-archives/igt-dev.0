Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 17:17:10 -0000
Message-ID: <158014543043.9684.11980775119707541688@emeril.freedesktop.org>
References: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/5=5D_i915=3A_Start_putting_the?=
 =?utf-8?q?_mmio=5Fbase_to_wider_use?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/5] i915: Start putting the mmio_base to wider use
URL   : https://patchwork.freedesktop.org/series/72620/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/101870 for the overview.

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1472953):
    CCLD     vgem_basic
    CCLD     vgem_slow
    CCLD     sysfs_heartbeat_interval
  /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/8/../../../x86_64-linux-gnu/Scrt1.o: in function `_start':
  (.text+0x20): undefined reference to `main'
  collect2: error: ld returned 1 exit status
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[3]: *** [Makefile:4564: sysfs_heartbeat_interval] Error 1
  make[2]: *** [Makefile:5341: all-recursive] Error 1
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tests'
  make[1]: *** [Makefile:514: all-recursive] Error 1
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make: *** [Makefile:446: all] Error 2
  section_end:1580145327:build_script
  [0Ksection_start:1580145327:after_script
  [0Ksection_end:1580145328:after_script
  [0Ksection_start:1580145328:upload_artifacts_on_failure
  [0Ksection_end:1580145330:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/101870
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
