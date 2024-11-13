Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCA2D462D3
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 16:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAE710E6FB;
	Wed, 13 Nov 2024 16:34:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1255410E6FB;
 Wed, 13 Nov 2024 16:34:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0350737600416914014=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/kms=5Ffbcon=5Ff?=
 =?utf-8?q?bt=3A_Add_skip_condition_for_bmg_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 16:34:46 -0000
Message-ID: <173151568605.3666420.11274853756208034305@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113110104.125403-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113110104.125403-1-mohammed.thasleem@intel.com>
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

--===============0350737600416914014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_fbcon_fbt: Add skip condition for bmg platform
URL   : https://patchwork.freedesktop.org/series/141281/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8106_full -> IGTPW_12088_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12088_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12088_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12088_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-mtlp:         [PASS][5] -> [SKIP][6] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_fbcon_fbt@fbc-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_12088_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#9318])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#9318])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@debugfs_test@basic-hwmon.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#9318])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][12] ([i915#11814] / [i915#11815])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@isolation@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@drm_fdinfo@isolation@rcs0.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8414])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@drm_fdinfo@virtual-busy.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#7697]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@close-race:
    - shard-tglu:         NOTRUN -> [FAIL][17] ([i915#12296] / [i915#12577])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_busy@close-race.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@gem_busy@semaphore.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#4873])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@gem_caching@reads.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][22] ([i915#7297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][26] ([i915#12392] / [i915#7297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#7697]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#7697]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#8562])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#12031])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html
    - shard-mtlp:         NOTRUN -> [FAIL][34] ([i915#12031])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][37] -> [FAIL][38] ([i915#5784])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-6/igt@gem_eio@kms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][39] -> [FAIL][40] ([i915#12714] / [i915#5784])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4771])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#8555])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@nop:
    - shard-mtlp:         [PASS][43] -> [DMESG-WARN][44] ([i915#12412])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-4/igt@gem_exec_balancer@nop.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4525])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#6344])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4473] / [i915#4771]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][49] ([i915#2842]) +3 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-tglu-1:       NOTRUN -> [FAIL][50] ([i915#2842]) +3 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][51] ([i915#2842]) +7 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-tglu:         [PASS][53] -> [FAIL][54] ([i915#2842]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-4/igt@gem_exec_fair@basic-pace-share.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_exec_fair@basic-pace-solo.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4473])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4812]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3281]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3281]) +11 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@pi-ringfull@vecs0:
    - shard-rkl:          NOTRUN -> [FAIL][63] ([i915#12296]) +4 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_exec_schedule@pi-ringfull@vecs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4537] / [i915#4812])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4860])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4860])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4860])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4613]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#284])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4083]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4077]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4077]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4077]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4083]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4083]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3282]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@bench:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3282]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_pread@bench.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][81] ([i915#2658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#4270]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#4270]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4270]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#4270]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4270]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4270]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@gem_readwrite@beyond-eob.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3282]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#5190] / [i915#8428]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#8428]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#8411]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4079])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4079])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4079])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4879])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3297])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4880]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#3297]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#2527]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@gen9_exec_parse@bb-chained.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#2856]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#2856]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#2527]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#2527] / [i915#2856]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#6227])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu-1:       NOTRUN -> [ABORT][108] ([i915#10887] / [i915#9820])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][109] -> [ABORT][110] ([i915#10131] / [i915#10887] / [i915#9820])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][111] ([i915#9820])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#8399])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#6590]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][114] ([i915#2681]) +4 other tests warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][115] -> [FAIL][116] ([i915#12739] / [i915#3591])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglu:         [PASS][117] -> [ABORT][118] ([i915#8213])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-6/igt@i915_pm_rpm@system-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#11681])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#4387])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@i915_pm_sseu@full-enable.html
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#4387])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4387])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#8437])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#5723])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5723])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][126] -> [ABORT][127] ([i915#12061]) +1 other test abort
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-3/igt@i915_selftest@live@workarounds.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][128] ([i915#9311]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-snb:          [PASS][129] -> [ABORT][130] ([i915#12450])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@i915_selftest@perf.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@i915_selftest@perf.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-snb:          [PASS][131] -> [ABORT][132] ([i915#11703])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@i915_selftest@perf@engine_cs.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@i915_selftest@perf@engine_cs.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#4212])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4212] / [i915#5190])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4212])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#8709]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#9531])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#1769] / [i915#3555])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][139] +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#5286]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#5286]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5286]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3638])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#5190]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#6187])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#6095]) +34 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#12313]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#6095]) +84 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#12313])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#6095]) +24 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#6095]) +90 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12313])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#6095]) +150 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6095]) +17 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#12313]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +120 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg1:          NOTRUN -> [SKIP][161] +26 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][162] +11 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#7828]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#7828]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#7828]) +10 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +11 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7828]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#7828]) +8 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#3555] / [i915#9979])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][170] +71 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#6944] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#7116] / [i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3116] / [i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#8063] / [i915#9433])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#6944] / [i915#7116] / [i915#7118])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#9424]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#7118] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#8814]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3555]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#11453] / [i915#3359]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#11453] / [i915#3359])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#11453] / [i915#3359]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3555]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#9809]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#4103]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#4213])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][191] +15 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#9723])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][194] ([i915#12638])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#9723])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9833])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3555]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#1769] / [i915#3555] / [i915#3804])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3804])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#3804])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8812])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#8812])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8812])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3840] / [i915#9053])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3955])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3469]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3469])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#4854])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#4854])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#4854])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#2065] / [i915#4854])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#4854])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#1839])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#1839])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#1839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#1839])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#1839])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#658])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#658])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#658])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#4881]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_fence_pin_leak.html
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#4881])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#4881])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3637]) +8 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#9934]) +6 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#3637] / [i915#3966])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9934]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3637]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#3637]) +4 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][233] -> [FAIL][234] ([i915#2122]) +1 other test fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#8381])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#8381]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#2672])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#2672] / [i915#8813]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#2587] / [i915#2672]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555]) +5 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#2587] / [i915#2672]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#8708]) +10 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#8708]) +23 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#1825]) +18 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-snb:          [PASS][253] -> [SKIP][254] +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#5439])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3458]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#3458]) +18 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#10433] / [i915#3458]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#1825]) +25 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#5354]) +52 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][261] +94 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] +31 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#9766])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#8708]) +10 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#3023]) +16 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#3555] / [i915#8228]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8228]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8228]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8228]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8228])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#10656])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#12388]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#12339]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#6301])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#6301])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#6301])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#11614] / [i915#3582]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#3555]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#3555]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@kms_plane_multiple@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8806])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8806])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#6953])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#12247] / [i915#9423])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#12247]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#12247]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#12247] / [i915#6953])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#12247]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#12247] / [i915#6953])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#12247]) +3 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#12247] / [i915#3555])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#12247]) +4 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9812])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#9812])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#5354])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#12343])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#12343])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#5354]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#9685])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9685])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#5978])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#3361])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#10139]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#3361])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#3828])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#8430])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][309] -> [SKIP][310] ([i915#9519])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#9519]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#9519])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#9519])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#6524] / [i915#6805])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#6524])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#11520]) +6 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#11520]) +9 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#9808]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#12316]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#11520]) +4 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#11520]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][323] ([i915#11520]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#11520]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-18/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#4348]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#9683])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#9683])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#9683]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#9683]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#1072] / [i915#9732]) +11 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#9688]) +11 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#1072] / [i915#9732]) +27 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#1072] / [i915#9732]) +20 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#9732]) +24 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#4077] / [i915#9688]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#9732]) +9 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#9685])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#9685])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#5289])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#12755])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#12755] / [i915#5190])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#8623])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#8623])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#8623])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#9906])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#9906]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9906])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#9906])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#2437])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#2437] / [i915#9412]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#2437])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#2437] / [i915#9412])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#2437] / [i915#9412]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#2437] / [i915#9412])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#2436])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][357] ([i915#9100]) +1 other test fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@perf@non-zero-reason.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#2433])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][359] ([i915#4349]) +5 other tests fail
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@perf_pmu@busy-double-start.html
    - shard-dg2:          NOTRUN -> [FAIL][360] ([i915#4349]) +1 other test fail
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][361] ([i915#4349]) +2 other tests fail
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#3708])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#9917])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#9917])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9917])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#9917]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-mtlp:         NOTRUN -> [FAIL][367] ([i915#12564] / [i915#9781])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-dg2:          NOTRUN -> [FAIL][368] ([i915#12564] / [i915#9781])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-rkl:          NOTRUN -> [FAIL][369] ([i915#12564] / [i915#9781])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-dg1:          NOTRUN -> [FAIL][370] ([i915#12564] / [i915#9781])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][371] ([i915#11713]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-5/igt@gem_exec_big@single.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [FAIL][373] ([i915#2842]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-5/igt@gem_exec_fair@basic-none@vecs0.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [FAIL][375] ([i915#2876]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][377] ([i915#7975] / [i915#8213]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-dg1:          [INCOMPLETE][379] -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-18/igt@gem_softpin@noreloc-s3.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][381] ([i915#12739] / [i915#3591]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglu:         [ABORT][383] -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-snb:          [FAIL][385] ([i915#2122]) -> [PASS][386] +1 other test pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu:         [FAIL][387] ([i915#2122]) -> [PASS][388] +1 other test pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-rkl:          [FAIL][389] ([i915#11989] / [i915#2122]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          [FAIL][391] ([i915#2122]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][393] -> [PASS][394] +6 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [SKIP][395] ([i915#9519]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@perf_pmu@semaphore-busy:
    - shard-dg2:          [FAIL][397] ([i915#4349]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-10/igt@perf_pmu@semaphore-busy.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@perf_pmu@semaphore-busy.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace:
    - shard-rkl:          [FAIL][399] ([i915#12467] / [i915#2842]) -> [FAIL][400] ([i915#2842])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@gem_exec_fair@basic-pace.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_fair@basic-pace.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][401] ([i915#12713]) -> [SKIP][402] ([i915#1187] / [i915#12713])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][403] ([i915#4816]) -> [SKIP][404] ([i915#4070] / [i915#4816])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#11815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815
  [i915#11823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11823
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12031]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12031
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12296]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12296
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12412
  [i915#12450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12450
  [i915#12467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12467
  [i915#12555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12555
  [i915#12564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564
  [i915#12577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12577
  [i915#12638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12638
  [i915#12646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12646
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
  [i915#12739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12739
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3966
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i91

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/index.html

--===============0350737600416914014==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_fbcon_fbt: Add skip condition for bmg platform</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141281/">https://patchwork.freedesktop.org/series/141281/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8106_full -&gt; IGTPW_12088_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12088_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12088_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12088_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a></li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a></li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12088_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815">i915#11815</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@drm_fdinfo@isolation.html">SKIP</a> ([i915#8414]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@drm_fdinfo@isolation@rcs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@drm_fdinfo@virtual-busy.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_busy@close-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12296">i915#12296</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12577">i915#12577</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@gem_caching@reads.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / [i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12031">i915#12031</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12031">i915#12031</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-13/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714">i915#12714</a> / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-4/igt@gem_exec_balancer@nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@gem_exec_balancer@nop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12412">i915#12412</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +3 other tests fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_exec_fair@basic-pace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-4/igt@gem_exec_fair@basic-pace-share.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / [i915#4852]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vecs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_exec_schedule@pi-ringfull@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12296">i915#12296</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@gem_lmem_swapping@basic.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_lmem_swapping@massive.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_mmap@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_mmap_gtt@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@gem_mmap_wc@invalid-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887">i915#10887</a> / [i915#9820])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887">i915#10887</a> / [i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +4 other tests warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12739">i915#12739</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-6/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@i915_pm_rpm@system-suspend.html">ABORT</a> ([i915#8213])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@i915_selftest@perf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@i915_selftest@perf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12450">i915#12450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@i915_selftest@perf@engine_cs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@i915_selftest@perf@engine_cs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703">i915#11703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#6095]) +150 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#6095]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / [i915#6095]) +120 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#9979])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> +71 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063] / [i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> ([i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#9809]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / [i915#4213]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12638">i915#12638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-19/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a> / [i915#4854])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([i915#9934]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3966">i915#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8813]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#5354]) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8228]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8228]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8228]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-14/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-3/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8806])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#9812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139">i915#10139</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-18/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#4348]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-2/igt@kms_psr@pr-primary-mmap-cpu.html">SKIP</a> ([i915#9688]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> ([i915#9732]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> ([i915#9732]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / [i915#9412]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / [i915#9412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / [i915#9412]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / [i915#9412])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-5/igt@perf@non-zero-reason.html">FAIL</a> ([i915#9100]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-7/igt@perf_pmu@busy-double-start.html">FAIL</a> ([i915#4349]) +5 other tests fail</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-6/igt@perf_pmu@busy-double-start.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-4/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-7/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-8/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564">i915#12564</a> / [i915#9781])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-2/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564">i915#12564</a> / [i915#9781])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564">i915#12564</a> / [i915#9781])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-12/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564">i915#12564</a> / [i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-5/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-2/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-5/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876">i915#2876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-18/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-16/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12739">i915#12739</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-4/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-tglu-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-dg2-10/igt@perf_pmu@semaphore-busy.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-dg2-8/igt@perf_pmu@semaphore-busy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-7/igt@gem_exec_fair@basic-pace.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12467">i915#12467</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-3/igt@gem_exec_fair@basic-pace.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12088/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070">i915#4070</a> / [i915#4816])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[i91</p>

</body>
</html>

--===============0350737600416914014==--
