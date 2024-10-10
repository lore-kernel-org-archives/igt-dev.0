Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1BDCF11F1
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 13:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1561E10E8EC;
	Thu, 10 Oct 2024 13:10:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977B710E8EA;
 Thu, 10 Oct 2024 13:10:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5939839263758011634=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Add_DC5_retention_flops_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Oct 2024 13:10:26 -0000
Message-ID: <172856582660.1215352.8017337991766050293@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20230327181202.6797-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230327181202.6797-1-mohammed.thasleem@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============5939839263758011634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add DC5 retention flops test
URL   : https://patchwork.freedesktop.org/series/139766/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15498_full -> IGTPW_11889_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11889_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11889_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/index.html

Participating hosts (7 -> 8)
------------------------------

  Additional (2): shard-glk-0 shard-tglu-1 
  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11889_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-13/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [ABORT][5] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15498_full and IGTPW_11889_full:

### New IGT tests (1) ###

  * igt@kms_pm_dc@dc5-retention-flops:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11889_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#11078]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all:
    - shard-snb:          NOTRUN -> [SKIP][14] +38 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb1/igt@drm_fdinfo@busy-check-all.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8414]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8414]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#7697]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#9323]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#7697]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#6335]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#8562])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         NOTRUN -> [FAIL][31] ([i915#12027])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg1:          [PASS][32] -> [INCOMPLETE][33] ([i915#12353])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-13/igt@gem_ctx_isolation@preservation-s3.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#8555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][37] ([i915#11980])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#280]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#280]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][43] ([i915#10030] / [i915#7975] / [i915#8213])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          NOTRUN -> [FAIL][44] ([i915#5784])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4812]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4812])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4812])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4525])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [FAIL][49] ([i915#6117])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#6334]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#6334]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#6344])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_exec_fair@basic-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4473] / [i915#4771])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][55] ([i915#2842]) +5 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][56] ([i915#2842]) +23 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3539])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3281]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3281]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3281]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@pi-common:
    - shard-tglu:         NOTRUN -> [FAIL][63] ([i915#12296]) +11 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_exec_schedule@pi-common.html

  * igt@gem_exec_schedule@pi-common@vcs0:
    - shard-rkl:          NOTRUN -> [FAIL][64] ([i915#12296]) +4 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@gem_exec_schedule@pi-common@vcs0.html

  * igt@gem_exec_schedule@pi-ringfull@vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][65] ([i915#12296]) +5 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_exec_schedule@pi-ringfull@vecs0.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4537] / [i915#4812])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][67] -> [INCOMPLETE][68] ([i915#11441]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4860])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#2190])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613] / [i915#7582])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4613]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4613]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4613]) +17 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#12193]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4565]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3282])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@gem_madvise@dontneed-before-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3282]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#284])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4077]) +10 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4077]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4083]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4083]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4083]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#3282]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@bench:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3282]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@gem_pread@bench.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][87] ([i915#2658]) +1 other test warn
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#4270]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#4270]) +17 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4270]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4270]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4270]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#5190] / [i915#8428]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#8428]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4079])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4079])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4079])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4885])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#3323])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3282] / [i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#3297]) +8 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3297]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3297]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3297]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][106] +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#2527]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gen9_exec_parse@bb-large.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#2856]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#2856]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#2527]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#2527] / [i915#2856]) +14 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#6227])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@i915_module_load@load.html
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#6227])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][114] ([i915#10887] / [i915#9820])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6412])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#6412])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#8399]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8399])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#6590]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][120] ([i915#2681]) +4 other tests warn
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#4387])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#5723])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#5723])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-mtlp:         NOTRUN -> [ABORT][124] ([i915#12216])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][125] -> [ABORT][126] ([i915#12216])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][127] ([i915#9311]) +1 other test dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][128] ([i915#7443])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4077]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#7707])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@intel_hwmon@hwmon-read.html
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#7707])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#3826])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#8709]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#8709]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#8709]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#9531])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][137] -> [FAIL][138] ([i915#5956]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#1769] / [i915#3555]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#5286]) +29 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#9197])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#5286]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#5286])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538] / [i915#5286]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3638]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3638]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][147] +19 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +10 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4538]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#6187])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#12313]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6095]) +24 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#6095]) +294 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#6095]) +196 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#6095]) +84 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#12313]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#6095]) +116 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#3742]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#11616] / [i915#7213]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#4087]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#7828]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_chamelium_audio@dp-audio.html
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7828]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7828]) +11 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7828]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7828]) +41 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#9979])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3116] / [i915#3299]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3299])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3116]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_content_protection@lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#7118])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#6944] / [i915#7116] / [i915#7118])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7118] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#7118] / [i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#7116] / [i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3555] / [i915#6944] / [i915#9424])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][184] ([i915#1339] / [i915#7173])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_content_protection@uevent@pipe-a-dp-3.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#11453])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#11453]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3555]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-dg2:          [PASS][188] -> [SKIP][189] ([i915#9197])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-10/igt@kms_cursor_crc@cursor-random-64x21.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8814])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3555]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3555] / [i915#8814])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#11453])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2:          [PASS][194] -> [INCOMPLETE][195] ([i915#12358] / [i915#7882])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:
    - shard-dg2:          [PASS][196] -> [INCOMPLETE][197] ([i915#12358])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#4103]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#9809]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#5354]) +18 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#9067])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#4103]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#4213])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#4103] / [i915#4213])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#4103] / [i915#4213])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#9723]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3555]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#8588])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8588])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#8588])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#8588])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#1769] / [i915#3555] / [i915#3804])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3804])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3804])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#1257])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#1257])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#1257])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3840])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#3840]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#3840])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3840])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3555] / [i915#3840]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#3840] / [i915#9053])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#3955])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3469]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#2065] / [i915#4854])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#4854])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#1839]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#9337])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9337])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#9337])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#9337])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#658]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#658])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#3637]) +32 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#3637] / [i915#3966]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3637]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#9934]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8381])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#8381])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-1/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][241] ([i915#4423])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-snb:          [PASS][242] -> [FAIL][243] ([i915#10826]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [PASS][244] -> [FAIL][245] ([i915#2122])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-6/igt@kms_flip@plain-flip-fb-recreate.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][246] ([i915#2122])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [PASS][247] -> [SKIP][248] ([i915#5354])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [PASS][249] -> [FAIL][250] ([i915#2122]) +7 other tests fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][251] ([i915#2122]) +1 other test fail
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +21 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#2587] / [i915#2672] / [i915#3555]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#2672] / [i915#8813]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#2587] / [i915#2672] / [i915#3555])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#2672]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555]) +17 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#2587] / [i915#2672]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#2672]) +9 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][264] +34 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-snb:          [PASS][265] -> [SKIP][266]
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#5439]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#3458]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#1825]) +16 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#3023]) +29 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#9766])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#3458]) +13 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#8708])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#1825]) +51 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#8708]) +13 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][276] +421 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#8708]) +8 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#6118])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#433])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#3555] / [i915#8228])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][282] -> [SKIP][283] ([i915#3555] / [i915#8228]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-10/igt@kms_hdr@static-toggle.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8228])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#10656]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12388]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12394]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#10656])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#10656])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#12394])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#10656])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#12339]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#6301])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][296] ([i915#8292]) +1 other test fail
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][297] ([i915#8292])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#12247]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#12247]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#12247] / [i915#6953]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#12247]) +77 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#6953]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#12247] / [i915#3555])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12343])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#5354])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#5354]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#9812]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#9685])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9685])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_pm_dc@dc5-psr.html

  * {igt@kms_pm_dc@dc5-retention-flops} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#3828])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [FAIL][311] ([i915#9295])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#9685]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#3828]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#8430])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9519]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#9519]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][317] -> [SKIP][318] ([i915#9519]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#6524] / [i915#6805])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#6524])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#6524]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#9808]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#11520]) +11 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#12316]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#11520]) +41 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][326] ([i915#11520]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#11520]) +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#11520]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#9683])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9683])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#9683]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_psr2_su@page_flip-p010.html
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#4348])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#1072] / [i915#9732]) +24 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#1072] / [i915#9732]) +15 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#9732]) +103 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#9688]) +7 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#1072] / [i915#9732]) +12 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#9685]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#11131]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#11131]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#5190]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#5289]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#5289]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#5289])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#3555]) +24 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-dg2:          [PASS][346] -> [FAIL][347] ([i915#5465])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-7/igt@kms_setmode@basic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][348] ([i915#5465]) +1 other test fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_setmode@basic@pipe-a-dp-3.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][349] -> [FAIL][350] ([IGT#2])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_sysfs_edid_timing.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#8623]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#8623])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#8623])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-mtlp:         [PASS][354] -> [FAIL][355] ([i915#9196]) +1 other test fail
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#9906]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#11920])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#11920])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#9906])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#3555] / [i915#9906])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3555] / [i915#9906])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#3555] / [i915#9906])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#9906])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#8808] / [i915#9906])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#2437])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#2437]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#2437] / [i915#9412])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#2437] / [i915#9412]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#7387])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@perf@global-sseu-config.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#8850])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#8516]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#3291] / [i915#3708])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#3708])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#3708]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#9917])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#9917])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#9917])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#9917]) +2 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][379] ([i915#9781])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][380] ([i915#9781])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][381] +32 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][382] ([i915#12027]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html
    - shard-mtlp:         [FAIL][384] ([i915#12027]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][386] ([i915#5784]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-5/igt@gem_eio@reset-stress.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][388] ([i915#5784]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-rkl:          [FAIL][390] ([i915#2842]) -> [PASS][391] +3 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-4/igt@gem_exec_fair@basic-pace-share.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_exec_fair@basic-pace-share.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][392] -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][394] ([i915#3591]) -> [PASS][395] +2 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_selftest@live:
    - shard-dg2:          [ABORT][396] ([i915#12133]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-3/igt@i915_selftest@live.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@i915_selftest@live.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][398] ([i915#11808] / [i915#5956]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg1:          [DMESG-WARN][400] ([i915#4423]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-19/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [FAIL][402] -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [FAIL][404] ([i915#11989] / [i915#2122]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
    - shard-mtlp:         [FAIL][406] ([i915#11989] / [i915#2122]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-mtlp:         [FAIL][408] ([i915#2122]) -> [PASS][409] +2 other tests pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2:
    - shard-rkl:          [FAIL][410] ([i915#12034]) -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][412] ([i915#2122]) -> [PASS][413] +9 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg1:          [FAIL][414] ([i915#11989] / [i915#2122]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-14/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [FAIL][416] ([i915#2122]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          [SKIP][418] ([i915#3555]) -> [PASS][419] +5 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][420] ([i915#5354]) -> [PASS][421] +21 other tests pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][422] -> [PASS][423] +14 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][424] ([i915#3555] / [i915#8228]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2:          [SKIP][426] ([i915#8825]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane@pixel-format-source-clamping.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-dg2:          [SKIP][428] ([i915#7294]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2:          [SKIP][430] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][431] +2 other tests pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:
    - shard-dg2:          [SKIP][432] ([i915#12247]) -> [PASS][433] +17 other tests pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d:
    - shard-dg2:          [SKIP][434] ([i915#12247] / [i915#8152]) -> [PASS][435] +4 other tests pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [SKIP][436] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - shard-dg2:          [SKIP][438] ([i915#

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/index.html

--===============5939839263758011634==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add DC5 retention flops test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139766/">https://patchwork.freedesktop.org/series/139766/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15498_full -&gt; IGTPW_11889_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11889_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11889_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/index.html</p>
<h2>Participating hosts (7 -&gt; 8)</h2>
<p>Additional (2): shard-glk-0 shard-tglu-1 <br />
  Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11889_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-13/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_ctx_isolation@preservation-s3@vcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15498_full and IGTPW_11889_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pm_dc@dc5-retention-flops:<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11889_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb1/igt@drm_fdinfo@busy-check-all.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@drm_fdinfo@busy-check-all@vecs1.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-13/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> ([i915#12353])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@gem_eio@hibernate.html">ABORT</a> ([i915#10030] / [i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> ([i915#6117])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +23 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@gem_exec_schedule@pi-common.html">FAIL</a> ([i915#12296]) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common@vcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@gem_exec_schedule@pi-common@vcs0.html">FAIL</a> ([i915#12296]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_exec_schedule@pi-ringfull@vecs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#11441]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#12193]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy.html">SKIP</a> ([i915#4077]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@gem_mmap_wc@read-write.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@gem_pread@bench.html">SKIP</a> ([i915#3282]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2527]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([i915#2527] / [i915#2856]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10887] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([i915#8399]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681]) +4 other tests warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@i915_selftest@live.html">ABORT</a> ([i915#12216])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@i915_selftest@live@workarounds.html">ABORT</a> ([i915#12216])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#7443])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> ([i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#5286]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([i915#3638]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +294 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +196 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#6095]) +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#11616] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555] / [i915#9979])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_content_protection@uevent@pipe-a-dp-3.html">FAIL</a> ([i915#1339] / [i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#11453]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-10/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> ([i915#9197])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> ([i915#12358] / [i915#7882])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html">INCOMPLETE</a> ([i915#12358])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([i915#9809]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#5354]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4213])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#1769] / [i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#2065] / [i915#4854])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([i915#3637] / [i915#3966]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-1/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> ([i915#10826]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-6/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">FAIL</a> ([i915#2122]) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([i915#3458]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#3023]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +421 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#8708]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#12388]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#12394]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([i915#12339]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#9812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc5-retention-flops} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#3828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-2/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> ([i915#1072] / [i915#9732]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-17/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> ([i915#9732]) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> ([i915#9688]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_psr@psr-primary-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#11131]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#11131]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_setmode@basic@pipe-a-dp-3.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> ([i915#9196]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-16/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-10/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-13/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-9/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-19/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> ([i915#9917]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-tglu-2/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@tools_test@sysfs_l3_parity.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-5/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-13/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-4/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@gem_exec_fair@basic-pace-share.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-3/igt@i915_selftest@live.html">ABORT</a> ([i915#12133]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> ([i915#11808] / [i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-19/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-15/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> ([i915#11989] / [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> ([i915#11989] / [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-mtlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html">FAIL</a> ([i915#12034]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb2/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> +9 other tests pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg1-14/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> ([i915#11989] / [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> ([i915#8825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-10/igt@kms_plane_alpha_blend@constant-alpha-mid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15498/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11889/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          [SKIP][438] ([i915#</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5939839263758011634==--
