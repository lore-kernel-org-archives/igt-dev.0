Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C6C36002
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 00:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E042410E099;
	Mon,  7 Apr 2025 00:36:41 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D25910E099;
 Mon,  7 Apr 2025 00:36:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7097396576825648240=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/kms=5Fflip=3A_Add_fl?=
 =?utf-8?q?ip-vs-dpms-on-nop_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Apr 2025 00:36:40 -0000
Message-ID: <174398620020.41610.14964820135694949079@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
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

--===============7097396576825648240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Add flip-vs-dpms-on-nop subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/145664/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8301_FULL -> XEIGTPW_12907_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12907_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12907_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12907_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][3] -> ([SKIP][4], [PASS][5]) +4 other tests ( 1 pass, 1 skip )
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][9] -> ([SKIP][10], [SKIP][11]) ([Intel XE#836])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-dg2-set2:     [PASS][12] -> ([PASS][13], [INCOMPLETE][14])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@xe_exec_compute_mode@lr-mode-workload.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_exec_compute_mode@lr-mode-workload.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm:
    - shard-lnl:          [PASS][15] -> ([DMESG-FAIL][16], [PASS][17])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][18]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_vm@large-split-misaligned-binds-16777216:
    - shard-lnl:          [PASS][19] -> ([PASS][20], [ABORT][21])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-4/igt@xe_vm@large-split-misaligned-binds-16777216.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_vm@large-split-misaligned-binds-16777216.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@xe_vm@large-split-misaligned-binds-16777216.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          [SKIP][22] ([Intel XE#656]) -> ([SKIP][23], [ABORT][24]) ([Intel XE#656])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_psr@psr-no-drrs:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_psr@psr-no-drrs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr@psr-no-drrs.html

  
New tests
---------

  New tests have been introduced between XEIGT_8301_FULL and XEIGTPW_12907_FULL:

### New IGT tests (56) ###

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.00, 7.10] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.00, 6.96] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp2-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp2-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp2-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp2-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp2-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - Statuses : 3 pass(s)
    - Exec time: [6.84, 8.37] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - Statuses : 3 pass(s)
    - Exec time: [3.89, 8.11] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip@flip-vs-dpms-on-nop@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@flip-vs-dpms-on-nop@a-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@flip-vs-dpms-on-nop@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@flip-vs-dpms-on-nop@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_flip@flip-vs-dpms-on-nop@b-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@flip-vs-dpms-on-nop@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-dpms-on-nop@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@flip-vs-dpms-on-nop@d-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_flip@flip-vs-dpms-on-nop@d-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@flip-vs-dpms-on-nop@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@flip-vs-dpms-on-nop@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12907_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#540])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_3d.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_3d.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#827]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][31] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#3767]) +15 other tests ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#316]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1124]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#829]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#316]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2327]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#316])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][43] ([Intel XE#4543]) +3 other tests dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#607])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1124]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#607])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#1477])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#610])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1124])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1124])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#2191]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][58] -> ([SKIP][59], [PASS][60]) ([Intel XE#2191])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2191])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2314] / [Intel XE#2894])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2191]) +1 other test ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#367])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#367]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#367]) +1 other test ( 2 skip )
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#1512])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#787]) +260 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2887])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2907])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2669]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#787]) +47 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][80], [PASS][81]) ([Intel XE#3862]) +1 other test ( 1 incomplete, 1 pass )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#787]) +87 other tests ( 2 skip )
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][87], [SKIP][88]) ([Intel XE#455] / [Intel XE#787]) +24 other tests ( 2 skip )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2887]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#455] / [Intel XE#787]) +49 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][91] ([Intel XE#1727] / [Intel XE#3113])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#306]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#306])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#306])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#306])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_chamelium_color@degamma.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-bmg:          NOTRUN -> ([SKIP][100], [SKIP][101]) ([Intel XE#2252])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-multiple.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-lnl:          NOTRUN -> ([SKIP][102], [SKIP][103]) ([Intel XE#373])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-single.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#373]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2252]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#373]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#373]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#1178]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][109] ([Intel XE#1178]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][110], [FAIL][111]) ([Intel XE#1178])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#2390])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#307])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][115], [FAIL][116]) ([Intel XE#3304])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#1468])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_content_protection@mei-interface.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#1188])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1424])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2320])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#308])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-lnl:          NOTRUN -> ([SKIP][123], [SKIP][124]) ([Intel XE#2321])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#308]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([Intel XE#2320]) +1 other test ( 2 skip )
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][128] ([Intel XE#4173]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][129] -> ([SKIP][130], [PASS][131]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#323]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#309])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#309]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#309])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-lnl:          NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#309])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][138] -> ([PASS][139], [SKIP][140]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][141] -> ([SKIP][142], [SKIP][143]) ([Intel XE#309])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2286])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][145] -> ([PASS][146], [SKIP][147]) ([Intel XE#455])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#3009])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> ([SKIP][149], [SKIP][150]) ([Intel XE#2244])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#4422])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#776])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#701])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#702])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1137])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1135])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2374])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][161] -> ([SKIP][162], [SKIP][163]) ([Intel XE#310]) +1 other test ( 2 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][164] ([Intel XE#2049]) +1 other test incomplete
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][165] -> ([PASS][166], [FAIL][167]) ([Intel XE#3321]) +2 other tests ( 1 fail, 1 pass )
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][168] -> ([FAIL][169], [PASS][170]) ([Intel XE#301])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][171] -> ([FAIL][172], [FAIL][173]) ([Intel XE#3321]) +2 other tests ( 2 fail )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     [PASS][174] -> ([SKIP][175], [PASS][176]) ([Intel XE#310]) +6 other tests ( 1 pass, 1 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#310]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][178] -> ([SKIP][179], [PASS][180]) ([Intel XE#2316]) +3 other tests ( 1 pass, 1 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][181], [PASS][182]) ([Intel XE#310])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][183] -> ([FAIL][184], [PASS][185]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][186] -> ([FAIL][187], [FAIL][188]) ([Intel XE#301]) +1 other test ( 2 fail )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][189] -> ([FAIL][190], [PASS][191]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][192], [FAIL][193]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][194] -> ([FAIL][195], [PASS][196]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][197], [FAIL][198]) ([Intel XE#301])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][199], [SKIP][200]) ([Intel XE#2293] / [Intel XE#2380])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][201], [SKIP][202]) ([Intel XE#2293])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][203], [SKIP][204]) ([Intel XE#1401] / [Intel XE#1745])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][205], [SKIP][206]) ([Intel XE#1401])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#455]) +7 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2293]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#455]) +18 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#651]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2311]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][213], [SKIP][214]) ([Intel XE#651] / [Intel XE#656]) +3 other tests ( 2 skip )
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([Intel XE#2311]) +3 other tests ( 2 skip )
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#651]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][218] ([Intel XE#656]) +34 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#656]) +1 other test ( 2 skip )
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][221] -> ([SKIP][222], [SKIP][223]) ([Intel XE#656]) +1 other test ( 2 skip )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][224] -> [SKIP][225] ([Intel XE#783])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][226] -> [SKIP][227] ([Intel XE#656]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][228] -> ([PASS][229], [SKIP][230]) ([Intel XE#656]) +6 other tests ( 1 pass, 1 skip )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][231] -> ([SKIP][232], [PASS][233]) ([Intel XE#783]) +1 other test ( 1 pass, 1 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][234], [PASS][235]) ([Intel XE#656])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#4141]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][239], [SKIP][240]) ([Intel XE#2352])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#651]) +10 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#651])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][245] ([Intel XE#651]) +13 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#656]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#656]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#653]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#2313]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][250], [SKIP][251]) ([Intel XE#2313]) +7 other tests ( 2 skip )
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#653]) +12 other tests ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#653] / [Intel XE#656])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#1151])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][257], [SKIP][258]) ([Intel XE#658])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#653]) +14 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][260] ([Intel XE#1339])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> ([SKIP][261], [SKIP][262]) ([Intel XE#1470])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@kms_hdmi_inject@inject-4k.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][263] ([Intel XE#3374] / [Intel XE#3544])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][264] -> ([SKIP][265], [SKIP][266]) ([Intel XE#1503])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#346])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][269] ([Intel XE#346])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#2934])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2925])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> ([SKIP][273], [SKIP][274]) ([Intel XE#2501])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@bad-source:
    - shard-dg2-set2:     [PASS][275] -> ([SKIP][276], [PASS][277]) ([Intel XE#829])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_pipe_crc_basic@bad-source.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pipe_crc_basic@bad-source.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][278] -> [DMESG-WARN][279] ([Intel XE#4173]) +2 other tests dmesg-warn
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#4359])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][282] ([Intel XE#1035])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][283] ([Intel XE#2078]) +1 other test warn
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][284] -> ([PASS][285], [FAIL][286]) ([Intel XE#616])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_plane_cursor@viewport.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> ([PASS][287], [FAIL][288]) ([Intel XE#616])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          NOTRUN -> ([PASS][289], [SKIP][290]) ([Intel XE#4596])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([Intel XE#2493])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][293] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][296], [SKIP][297]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][298] ([Intel XE#2763]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][301] ([Intel XE#2763]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][302] ([Intel XE#2763]) +8 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#870])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][305], [SKIP][306]) ([Intel XE#2938])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][307] ([Intel XE#2938])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][308] ([Intel XE#870])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][309] ([Intel XE#870])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][310] ([Intel XE#1129])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          [PASS][311] -> ([FAIL][312], [PASS][313]) ([Intel XE#718])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][314], [SKIP][315]) ([Intel XE#908])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][316] ([Intel XE#836])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     NOTRUN -> ([PASS][319], [SKIP][320]) ([Intel XE#836])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][321] ([Intel XE#1489]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][322], [SKIP][323]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][324] ([Intel XE#1489]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][325] ([Intel XE#2893] / [Intel XE#4608])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][326] ([Intel XE#4608]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][327], [SKIP][328]) ([Intel XE#2893])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][331] ([Intel XE#1489]) +7 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> ([SKIP][332], [SKIP][333]) ([Intel XE#1128])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][334], [SKIP][335]) ([Intel XE#1122])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][336] ([Intel XE#1122])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][337] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][338] ([Intel XE#4609])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][340] ([Intel XE#1406]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][341] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#2850] / [Intel XE#929]) +5 other tests ( 2 skip )
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#2939])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][345] ([Intel XE#2939])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-bmg:          NOTRUN -> [SKIP][346] ([Intel XE#2414])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][347] ([Intel XE#3414]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][348] ([Intel XE#1874])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][349] ([Intel XE#1127])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][350] ([Intel XE#3414])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> ([SKIP][351], [SKIP][352]) ([Intel XE#1127])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][353] ([Intel XE#1127])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][354] ([Intel XE#3414] / [Intel XE#3904])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][355], [SKIP][356]) ([Intel XE#3414] / [Intel XE#3904])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][357] ([Intel XE#2413])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][358] -> ([PASS][359], [SKIP][360]) ([Intel XE#1435])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][361] -> ([FAIL][362], [PASS][363]) ([Intel XE#771])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][364], [SKIP][365]) ([Intel XE#455]) +8 other tests ( 2 skip )
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_vrr@flip-dpms.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][366] -> ([PASS][367], [FAIL][368]) ([Intel XE#4227]) +1 other test ( 1 fail, 1 pass )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@kms_vrr@flipline.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_vrr@flipline.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][369] ([Intel XE#1499]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#756])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_writeback@writeback-check-output.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][371] -> [ABORT][372] ([Intel XE#2705] / [Intel XE#4540])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@testdisplay.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@testdisplay.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#1126]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][374] ([Intel XE#2905]) +12 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][375] ([Intel XE#2905])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][376], [SKIP][377]) ([Intel XE#2905] / [Intel XE#3889])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          NOTRUN -> ([SKIP][378], [SKIP][379]) ([Intel XE#2905]) +2 other tests ( 2 skip )
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][380] ([Intel XE#2905]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][381] ([Intel XE#2905]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][382], [SKIP][383]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_eudebug@sysfs-toggle.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-adlp:         NOTRUN -> [SKIP][384] ([Intel XE#4519])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][385] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-lnl:          NOTRUN -> ([SKIP][386], [SKIP][387]) ([Intel XE#688]) +1 other test ( 2 skip )
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][388] ([Intel XE#688]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][389] ([Intel XE#2322]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][390] ([Intel XE#1392]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][391] ([Intel XE#1392])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][392] -> [SKIP][393] ([Intel XE#1392]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][394] ([Intel XE#1392]) +8 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][395], [SKIP][396]) ([Intel XE#2322])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][397], [PASS][398]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> ([SKIP][399], [SKIP][400]) ([Intel XE#1392]) +1 other test ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][401] -> ([PASS][402], [SKIP][403]) ([Intel XE#1392]) +11 other tests ( 1 pass, 1 skip )
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][404] ([Intel XE#288]) +22 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][405] ([Intel XE#288]) +6 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][406], [SKIP][407]) ([Intel XE#288]) +11 other tests ( 2 skip )
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][408] ([Intel XE#2360])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][409] ([Intel XE#255])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][410], [SKIP][411]) ([Intel XE#2229])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-adlp:         NOTRUN -> [SKIP][412] ([Intel XE#4045])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][413] -> ([FAIL][414], [PASS][415]) ([Intel XE#4208])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_module_load@reload-no-display.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         NOTRUN -> [SKIP][416] ([Intel XE#4501])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_oa@buffer-size.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][417], [SKIP][418]) ([Intel XE#2541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][419] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][420] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][421], [SKIP][422]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][423], [SKIP][424]) ([Intel XE#977])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> ([SKIP][425], [SKIP][426]) ([Intel XE#2236])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][427] ([Intel XE#979])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][428] ([Intel XE#1061])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][429] ([Intel XE#1173]) +1 other test fail
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][430], [SKIP][431]) ([Intel XE#2284] / [Intel XE#366]) +1 other test ( 2 skip )
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> ([SKIP][432], [SKIP][433]) ([Intel XE#2284] / [Intel XE#366])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][434] ([Intel XE#2284] / [Intel XE#366])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][435] -> ([PASS][436], [ABORT][437]) ([Intel XE#1794])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-1/igt@xe_pm@s4-basic.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@xe_pm@s4-basic.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][438] -> [ABORT][439] ([Intel XE#1794])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][440] ([Intel XE#944]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-adlp:         NOTRUN -> [SKIP][441] ([Intel XE#944])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][442], [SKIP][443]) ([Intel XE#944]) +1 other test ( 2 skip )
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][444] ([Intel XE#944])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> ([SKIP][445], [SKIP][446]) ([Intel XE#944]) +1 other test ( 2 skip )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          NOTRUN -> ([SKIP][447], [SKIP][448]) ([Intel XE#4130])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][449], [SKIP][450]) ([Intel XE#4130])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][451] ([Intel XE#4351]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-bmg:          NOTRUN -> [SKIP][452] ([Intel XE#4351])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][453] ([Intel XE#3862]) -> ([PASS][454], [PASS][455])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][456] ([Intel XE#3862]) -> [PASS][457]
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][458] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> ([PASS][459], [PASS][460])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][461] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][462]
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][463] ([Intel XE#4212] / [Intel XE#4522]) -> [PASS][464]
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [INCOMPLETE][465] ([Intel XE#3226]) -> ([PASS][466], [PASS][467]) +1 other test ( 2 pass )
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#309]) -> [PASS][469] +1 other test pass
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][470] ([Intel XE#2291]) -> ([PASS][471], [PASS][472]) +1 other test ( 2 pass )
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#309]) -> ([PASS][474], [PASS][475]) +1 other test ( 2 pass )
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][476] ([Intel XE#1475]) -> ([PASS][477], [PASS][478])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#4331]) -> ([PASS][480], [PASS][481])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][482] ([Intel XE#2316]) -> [PASS][483]
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][484] ([Intel XE#3321]) -> ([PASS][485], [PASS][486])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#310]) -> [PASS][488]
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#310]) -> ([PASS][490], [PASS][491]) +1 other test ( 2 pass )
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][492] ([Intel XE#301]) -> ([PASS][493], [PASS][494])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-adlp:         [DMESG-WARN][495] ([Intel XE#4173]) -> [PASS][496] +6 other tests pass
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-adlp-8/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][497] ([Intel XE#886]) -> ([PASS][498], [PASS][499]) +2 other tests ( 2 pass )
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#656]) -> [PASS][501] +1 other test pass
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#656]) -> ([PASS][503], [PASS][504]) +3 other tests ( 2 pass )
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#455]) -> [PASS][506] +1 other test pass
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#4596]) -> ([PASS][508], [PASS][509])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-x.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][510] ([Intel XE#1435]) -> ([PASS][511], [PASS][512])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][513] ([Intel XE#2142]) -> ([PASS][514], [PASS][515]) +1 other test ( 2 pass )
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#1392]) -> [PASS][517]
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#1392]) -> ([PASS][519], [PASS][520]) +3 other tests ( 2 pass )
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-lnl:          [ABORT][521] -> [PASS][522]
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][523] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][524] +2 other tests pass
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-adlp-8/igt@xe_module_load@many-reload.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][525] ([Intel XE#1794]) -> [PASS][526]
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-adlp-9/igt@xe_pm@s4-basic.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][527] ([Intel XE#1794]) -> [PASS][528]
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1124]) -> ([SKIP][530], [SKIP][531]) ([Intel XE#1124] / [Intel XE#829])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#1124]) -> [SKIP][533] ([Intel XE#829])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][534] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][535], [PASS][536]) ([Intel XE#2314] / [Intel XE#2894])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#787]) -> ([SKIP][538], [SKIP][539]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][541], [SKIP][542]) ([Intel XE#787]) +2 other tests ( 2 skip )
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][544] ([Intel XE#787]) +5 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#787]) -> [SKIP][546] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][547] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> ([INCOMPLETE][548], [INCOMPLETE][549]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][550] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][551] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][553], [SKIP][554]) ([Intel XE#455] / [Intel XE#787] / [Intel XE#829])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#4418]) -> ([SKIP][556], [SKIP][557]) ([Intel XE#4418] / [Intel XE#4440])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][558] ([Intel XE#2341]) -> ([SKIP][559], [FAIL][560]) ([Intel XE#1178] / [Intel XE#2341]) +1 other test ( 1 fail, 1 skip )
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_content_protection@atomic.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_content_protection@atomic.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#455]) -> ([FAIL][562], [FAIL][563]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][564] ([Intel XE#1178]) -> ([FAIL][565], [SKIP][566]) ([Intel XE#1178] / [Intel XE#2341])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#309]) -> ([SKIP][568], [PASS][569]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][570] ([Intel XE#2291]) -> ([PASS][571], [SKIP][572]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][573] ([i915#3804]) -> ([SKIP][574], [SKIP][575]) ([Intel XE#455] / [i915#3804])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#4354]) -> ([PASS][577], [SKIP][578]) ([Intel XE#4354])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][579] ([Intel XE#4294]) -> ([SKIP][580], [PASS][581]) ([Intel XE#4294])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [FAIL][582] ([Intel XE#886]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#310])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][585] ([Intel XE#301]) -> ([FAIL][586], [PASS][587]) ([Intel XE#301])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][588] ([Intel XE#3321]) -> ([PASS][589], [FAIL][590]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#310]) -> ([SKIP][592], [PASS][593]) ([Intel XE#310])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][594] ([Intel XE#2316]) -> ([SKIP][595], [PASS][596]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#651]) -> ([SKIP][598], [SKIP][599]) ([Intel XE#651] / [Intel XE#783])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#651]) -> [SKIP][601] ([Intel XE#656]) +2 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][602] ([Intel XE#2311]) -> ([SKIP][603], [SKIP][604]) ([Intel XE#2311] / [Intel XE#2312]) +8 other tests ( 2 skip )
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][605] ([Intel XE#2312]) -> ([SKIP][606], [SKIP][607]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#651]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#651] / [Intel XE#656]) +15 other tests ( 2 skip )
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#656]) -> [SKIP][612] ([Intel XE#651]) +4 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][613] ([Intel XE#2312]) -> ([SKIP][614], [SKIP][615]) ([Intel XE#4141])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#656]) -> ([SKIP][617], [PASS][618]) ([Intel XE#656]) +3 other tests ( 1 pass, 1 skip )
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][619] ([Intel XE#2312]) -> ([SKIP][620], [SKIP][621]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][622] ([Intel XE#4141]) -> ([SKIP][623], [SKIP][624]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#651]) -> [SKIP][626] ([Intel XE#783])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][627] ([Intel XE#2312]) -> ([SKIP][628], [SKIP][629]) ([Intel XE#2311] / [Intel XE#2312]) +9 other tests ( 2 skip )
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#656]) -> ([SKIP][631], [SKIP][632]) ([Intel XE#651] / [Intel XE#656]) +7 other tests ( 2 skip )
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#651]) -> ([SKIP][634], [SKIP][635]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#656]) -> ([SKIP][637], [SKIP][638]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][639] ([Intel XE#2312]) -> [SKIP][640] ([Intel XE#2311]) +1 other test skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#653]) -> ([SKIP][642], [SKIP][643]) ([Intel XE#656])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][644] ([Intel XE#2312]) -> ([SKIP][645], [SKIP][646]) ([Intel XE#2313]) +3 other tests ( 2 skip )
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][647] ([Intel XE#2313]) -> ([SKIP][648], [SKIP][649]) ([Intel XE#2312] / [Intel XE#2313]) +8 other tests ( 2 skip )
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][650] ([Intel XE#2313]) -> [SKIP][651] ([Intel XE#2312])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][652] ([Intel XE#2312]) -> ([SKIP][653], [SKIP][654]) ([Intel XE#2312] / [Intel XE#2313]) +9 other tests ( 2 skip )
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#653]) -> [SKIP][656] ([Intel XE#656]) +4 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#656]) -> [SKIP][658] ([Intel XE#653]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#653]) -> ([SKIP][660], [SKIP][661]) ([Intel XE#653] / [Intel XE#656]) +19 other tests ( 2 skip )
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][662] ([Intel XE#2313]) -> ([SKIP][663], [SKIP][664]) ([Intel XE#2312])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#656]) -> ([SKIP][666], [SKIP][667]) ([Intel XE#653]) +9 other tests ( 2 skip )
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#656]) -> ([SKIP][669], [SKIP][670]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][671] ([Intel XE#1503]) -> ([PASS][672], [SKIP][673]) ([Intel XE#1503])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][674] ([Intel XE#4328]) -> ([PASS][675], [SKIP][676]) ([Intel XE#4328])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#455]) -> ([SKIP][678], [SKIP][679]) ([Intel XE#455] / [Intel XE#829])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#4596]) -> ([SKIP][681], [PASS][682]) ([Intel XE#4596])
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][683] ([Intel XE#4596]) -> ([SKIP][684], [SKIP][685]) ([Intel XE#2493] / [Intel XE#4596])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][686] ([Intel XE#4596]) -> ([SKIP][687], [SKIP][688]) ([Intel XE#455])
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][689] ([Intel XE#4540]) -> ([ABORT][690], [ABORT][691]) ([Intel XE#2705] / [Intel XE#4540])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][692] ([Intel XE#4540]) -> ([ABORT][693], [ABORT][694]) ([Intel XE#4502] / [Intel XE#4540])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#836]) -> ([PASS][696], [SKIP][697]) ([Intel XE#836])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][698] ([Intel XE#362]) -> ([FAIL][699], [FAIL][700]) ([Intel XE#1729])
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][701] ([Intel XE#2509]) -> ([SKIP][702], [SKIP][703]) ([Intel XE#2426])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][704] ([Intel XE#362]) -> ([SKIP][705], [SKIP][706]) ([Intel XE#1500] / [Intel XE#362])
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][707] ([Intel XE#771]) -> ([FAIL][708], [PASS][709]) ([Intel XE#771]) +2 other tests ( 1 fail, 1 pass )
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][710] -> ([FAIL][711], [FAIL][712]) ([Intel XE#4459]) +1 other test ( 2 fail )
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [FAIL][713] ([Intel XE#4278]) -> ([PASS][714], [FAIL][715]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [SKIP][716] ([Intel XE#1392]) -> ([SKIP][717], [PASS][718]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][719] ([Intel XE#1999]) -> ([PASS][720], [FAIL][721]) ([Intel XE#1999]) +2 other tests ( 1 fail, 1 pass )
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][722] ([Intel XE#1173]) -> ([SKIP][723], [FAIL][724]) ([Intel XE#1061] / [Intel XE#1173])
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-435/igt@xe_peer2peer@read.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_peer2peer@read.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][725] ([Intel XE#1794]) -> ([ABORT][726], [PASS][727]) ([Intel XE#1794])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@xe_pm@s4-mocs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8301 -> IGTPW_12907
  * Linux: xe-2897-883e4daea46ff15b470f138ee61573513243210d -> xe-2898-6deef7a0418bc26082804287b18c8db1e0810686

  IGTPW_12907: 6317d16445b20bd88bf2d837a6e3afa706210b85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8301: 8301
  xe-2897-883e4daea46ff15b470f138ee61573513243210d: 883e4daea46ff15b470f138ee61573513243210d
  xe-2898-6deef7a0418bc26082804287b18c8db1e0810686: 6deef7a0418bc26082804287b18c8db1e0810686

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/index.html

--===============7097396576825648240==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_flip: Add flip-vs-dpms-on-nop subt=
est (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145664/">https://patchwork.freedesktop.org/series/145664/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8301_FULL -&gt; XEIGTPW_12907_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12907_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12907_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
907_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560=
x1440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@cursor=
b-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) =
+4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-pri-shrfb-draw-blt.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/i=
gt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@xe_exec_compute_mode@lr-mode-workload.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
907/shard-dg2-464/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2=
-466/igt@xe_exec_compute_mode@lr-mode-workload.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-im=
m.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12907/shard-lnl-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr=
-imm.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/shard-lnl-8/igt@xe_exec_fault_mode@once-bindexecqueue-user=
ptr-imm.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@xe_gt_freq@freq_reset_multiple=
.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-16777216:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-4/igt@xe_vm@large-split-misaligned-binds-16777216.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12907/shard-lnl-4/igt@xe_vm@large-split-misaligned-binds-16777216.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-lnl-5/igt@xe_vm@large-split-misaligned-binds-16777216.html">ABORT</a>)=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">ABORT</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-dg2-464/igt@kms_psr@psr-no-drrs.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8301_FULL and XEIGTPW_12907=
_FULL:</p>
<h3>New IGT tests (56)</h3>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 7.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-dp2-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-dp2-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-dp2-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-dp2-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-dp2-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.84, 8.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.89, 8.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12907_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_3d.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_3d.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/540">Intel XE#540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12907/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">I=
ntel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt=
@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-=
mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3767">Intel XE#3767</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-cc=
s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-dp-4-4-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-=
180-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offs=
et-overflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotat=
e-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset=
-overflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_bw@connected-linear-tiling-=
2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-dis=
plays-3840x2160p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_bw@connected-linear-tiling=
-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays=
-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12907/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x=
1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +260 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-=
gen12-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2887">Intel XE#2887</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-=
rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-18=
0-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3862">Intel XE#3862</a>) +1 other test ( 1 incomplete, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_ccs@crc-primary=
-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +87 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@crc-sprit=
e-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +49 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12907/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_chamelium_color@degamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_chamelium_color@degamma.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
07/shard-lnl-6/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-=
stress-resolution-4k.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-s=
tress-resolution-4k.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-mul=
tiple.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-s=
ingle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">=
Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_chamelium_frames@vga-frame-=
dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/225=
2">Intel XE#2252</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-enabl=
e-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_content_protection@atomic=
@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-d=
p-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_content_protection@dp-mst-t=
ype-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390"=
>Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_content_protection@dp-mst-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-type-0@=
pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_content_protection@mei-inte=
rface.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-lnl-4/igt@kms_content_protection@mei-interface.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468"=
>Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_content_protection@uevent@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12907/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-51=
2x512.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-6=
4x21.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@p=
ipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12907/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Int=
el XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-f=
lipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12907/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt=
@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_dp_aux_dev.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel =
XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with=
-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-d=
irty-rectangle-out-visible-area.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_feature_discovery@display-2=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_feature_discovery@dp-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_feature_discovery@psr1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-=
interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12907/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interrup=
tible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12907/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank@ad-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12907/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1290=
7/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432=
/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 oth=
er tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_flip@2x-plain-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"=
>Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12907/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
07/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_flip@2x-=
single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-ln=
l-5/igt@kms_flip@blocking-wf_vblank.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_flip@blocking=
-wf_vblank.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-int=
erruptible@b-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-hdmi-a6.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fai=
l )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
07/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 =
other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@flip-vs-expired-vbla=
nk@b-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi=
-a6.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
07/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@flip-vs-expired-vbla=
nk@d-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi=
-a6.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_flip_scaled_crc=
@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-vali=
d-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_flip_scaled_crc@=
flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-defa=
ult-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 oth=
er tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)=
 +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +34 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 ot=
her test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-pri-indfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-draw-blt.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) +1 other =
test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-ti=
ling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
2">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuff=
er_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +10 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@kms_frontbuffer_t=
racking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-=
y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@kms_hdmi_inject@inject-4k.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@=
kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra=
-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_multipipe_modeset@basic-max=
-pipe-crc-check.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-=
crc-check.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shar=
d-dg2-464/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_pip=
e_crc_basic@bad-source.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi=
-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a=
-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_plane@pixel-format.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_plane@pixel-format@pipe-a-p=
lane-3.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-432/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg=
2-466/igt@kms_plane_cursor@viewport.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_curso=
r@viewport.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_plane_cursor@viewport@pip=
e-a-hdmi-a-6-size-64.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe=
-a-hdmi-a-6-size-64.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-no=
ne.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12907/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_plane_multiple@tiling-y.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
07/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_plane_scaling@plane-downsca=
le-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_plane_scaling@pl=
ane-downscale-factor-0-25-with-rotation.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-c.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_plane_sca=
ling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_plane_scaling=
@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_plane_scaling@planes-unity-=
scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_backlight@basic-brightne=
ss.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12907/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel =
XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12907/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/293=
8">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_pm_backlight@fade-with-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Int=
el XE#1129</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sha=
rd-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
6">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#31=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12907/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no=
-wait.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-a=
rea.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-up=
date-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-=
sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_psr2_sf@psr2-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_psr2_su@frontbuffer-xrgb888=
8.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12907/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel X=
E#1128</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12907/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Int=
el XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_psr@fbc-pr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@kms_psr@psr-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-=
dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_psr_stress_test@invalidate-=
primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_rotation_crc@multiplane-rot=
ation-cropping-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@kms_rotation_crc@primary-4-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_rotation_crc@primary-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12907/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-refl=
ect-x-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1290=
7/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/i=
gt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard=
-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@k=
ms_vrr@flipline.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_vrr@flipline.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@kms_writeback@writeback-check-o=
utput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@testdisplay.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@testd=
isplay.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x=
369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@xe_eudebug@basic-read-event.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-metadat=
a-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-reconn=
ect.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-vm-des=
troy-discovery.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12907/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-di=
scovery.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-vm-de=
stroy-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@xe_eudebug@multigpu-basic-client=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_eudebug@sysfs-toggle.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-dg2-463/igt@xe_eudebug@sysfs-toggle.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@xe_evict@evict-beng-small-multi=
-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-p=
arallel-instantfree-samefd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_evict_ccs@evict-overcom=
mit-parallel-instantfree-samefd.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-=
null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-=
rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12907/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
2">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-d=
efer-bind.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</l=
i>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bas=
ic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12907/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer=
-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_exec_basic@multigpu-on=
ce-bindexecqueue-userptr-invalidate-race.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_ba=
sic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +11 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr=
-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_exec_fault_mode@once-invali=
d-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_exec_fault_mode@twice-inva=
lid-fault.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/288">Intel XE#288</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-=
interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_valid=
ate_ccs_kunit.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_mmap@pci-membarrier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045=
">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@xe_module_load@reload-no-display.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-dg2-464/igt@xe_module_load@reload-no-display.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt=
@xe_module_load@reload-no-display.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_oa@buffer-size.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Int=
el XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
907/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/254=
1">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12907/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sh=
ard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sh=
ard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979=
">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE=
#366</a>) +1 other test ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-lnl-6/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-7/igt@xe_pm=
@s4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-2/i=
gt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_query@multigpu-query-config=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_query@multigpu-query-oa-unit=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12907/shard-dg2-433/igt@xe_query@multigpu-query-topology.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-v=
ersion-huc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@xe_sriov_auto_provisioning@self=
config-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-ba=
sic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_sriov_auto_=
provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3862">Intel XE#3862</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@crc-primary-susp=
end-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@crc-p=
rimary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shar=
d-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-43=
2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3226">Intel XE#3226</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy=
.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-atomic.html">PASS</a>) +1 other test ( 2 pass )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475=
">Intel XE#1475</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331=
">Intel XE#4331</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_flip@2x-blocking-absolut=
e-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">In=
tel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check-int=
erruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interrupt=
ible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible@a-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_flip@flip-vs-e=
xpired-vblank-interruptible@a-hdmi-a6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-adlp-8/igt@kms_flip@modeset-vs-vblank-race-interruptible.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12907/shard-adlp-2/igt@kms_flip@modeset-vs-vblank-r=
ace-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Inte=
l XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-l=
nl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>) +2 other tests =
( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_=
frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a>) =
+3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2=
-433/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-bmg-8/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12907/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-st=
ealing.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12907/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtua=
l@pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12907/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pip=
e-a-edp-1.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@xe=
_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@xe_exec_basic@multigpu=
-no-exec-userptr-invalidate-race.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_exec_basic@mult=
igpu-no-exec-userptr-invalidate-race.html">PASS</a>) +3 other tests ( 2 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-race=
-prefetch.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12907/shard-lnl-1/igt@xe_exec_fault_mode@twice-userptr-inva=
lidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-adlp-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Inte=
l XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-adlp-2/igt@xe_module_load@many-reload.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-=
adlp-1/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#17=
94</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
907/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">=
Intel XE#1124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#=
1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
29">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_big_fb@yf-tile=
d-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-7/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2160x1440p.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#28=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pi=
pe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@bad-aux-str=
ide-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@ba=
d-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms=
_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg=
2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466=
/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@missing-=
ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sha=
rd-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_ccs@random-ccs-data-=
4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12907/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt=
@kms_content_protection@atomic.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) =
+1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard=
-dg2-466/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>=
) +1 other test ( 2 fail )</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-b=
mg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel X=
E#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-=
vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_cursor_legac=
y@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_=
cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12907/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-lega=
cy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12907/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/229=
1">Intel XE#2291</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3804">i915#3804</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12907/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sha=
rd-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">=
Intel XE#4294</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12907/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#=
4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886=
">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12907/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Int=
el XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@ad-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@bc-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank=
@bc-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12907/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt=
@kms_flip@2x-flip-vs-suspend.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12907/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard=
-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)=
 +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-7/igt@kms_frontbuf=
fer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">I=
ntel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-5/igt@kms_frontb=
uffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-46=
4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-1/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
>Intel XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-466/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE=
#1503</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12907/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-4/igt=
@kms_hdr@static-toggle-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">In=
tel XE#4328</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12907/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sha=
rd-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
907/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms=
_plane_lowres@tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2=
-432/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12907/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-bmg-3/i=
gt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12907/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-d=
g2-466/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540=
">Intel XE#4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4540">Intel XE#4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_plane_scaling@intel=
-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-435/igt@kms_plane_scaling@in=
tel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">I=
ntel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12907/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/s=
hard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12907/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907=
/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12907/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12907/shard-bmg-6/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/362">Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12907/shard-dg2-464/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12907/shard-dg2-433/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-l=
nl-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) +2 =
other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">INCOMPLETE</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shar=
d-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-lnl-3/igt@kms_vrr@cmrr@pi=
pe-a-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4459">Intel XE#4459</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278=
">Intel XE#4278</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12907/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2907/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Int=
el XE#4278</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-nul=
l-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12907/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-rebind=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1999">Intel XE#1999</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12907/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live=
_mocs_kernel_kunit.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12907/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mo=
cs_kernel_kunit.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/sh=
ard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-dg2-463/igt@xe_peer2peer@read=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8301/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12907/shard-l=
nl-2/igt@xe_pm@s4-mocs.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12907/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Inte=
l XE#1794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8301 -&gt; IGTPW_12907</li>
<li>Linux: xe-2897-883e4daea46ff15b470f138ee61573513243210d -&gt; xe-2898-6=
deef7a0418bc26082804287b18c8db1e0810686</li>
</ul>
<p>IGTPW_12907: 6317d16445b20bd88bf2d837a6e3afa706210b85 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8301: 8301<br />
  xe-2897-883e4daea46ff15b470f138ee61573513243210d: 883e4daea46ff15b470f138=
ee61573513243210d<br />
  xe-2898-6deef7a0418bc26082804287b18c8db1e0810686: 6deef7a0418bc2608280428=
7b18c8db1e0810686</p>

</body>
</html>

--===============7097396576825648240==--
