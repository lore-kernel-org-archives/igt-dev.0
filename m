Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CF7D5AE41
	for <igt-dev@archiver.kernel.org>; Sat, 13 Dec 2025 15:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4E410E120;
	Sat, 13 Dec 2025 15:15:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B85310E441;
 Sat, 13 Dec 2025 15:15:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8039068862032257734=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_intel-ci=3A_remove_few_i91?=
 =?utf-8?q?5_symlinks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 13 Dec 2025 15:15:20 -0000
Message-ID: <176563892005.84868.16720151137580063928@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
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

--===============8039068862032257734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: remove few i915 symlinks
URL   : https://patchwork.freedesktop.org/series/158863/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8665_FULL -> XEIGTPW_14203_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14203_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14203_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14203_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][1] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html

  
#### Warnings ####

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          [SKIP][3] ([Intel XE#6703]) -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  
New tests
---------

  New tests have been introduced between XEIGT_8665_FULL and XEIGTPW_14203_FULL:

### New IGT tests (1) ###

  * igt@kms_chamelium_frames:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14203_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#5993])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3432]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1424])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#6715])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2286])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2244])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1421])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2293]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +12 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#651])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#656]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313]) +15 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2927] / [Intel XE#6590])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#870])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#718]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2392])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1406])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#4609])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_psr@psr-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2414])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2413])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1499])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1447])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4837])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4837]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#4518])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][49] -> [INCOMPLETE][50] ([Intel XE#6321])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1392]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2322]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4943]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:
    - shard-lnl:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#2594])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared.html

  * igt@xe_exec_system_allocator@twice-large-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4943])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#5100])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2427])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2284])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#6251]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#944]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][63] -> [FAIL][64] ([Intel XE#6569]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#5937])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@xe_sriov_vram@vf-access-after-resize-down.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_sriov_vram@vf-access-after-resize-down.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][67] ([Intel XE#6779]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@core_hotunplug@hotrebind.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][71] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][73] ([Intel XE#2291]) -> [PASS][74] +3 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][75] ([Intel XE#2316]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][77] ([Intel XE#301]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][79] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [ABORT][81] ([Intel XE#1727]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][85] ([Intel XE#1435]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][87] ([Intel XE#2142]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@twice-large-mmap:
    - shard-bmg:          [SKIP][89] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@xe_exec_system_allocator@twice-large-mmap.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][91] ([Intel XE#6251]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          [SKIP][93] ([Intel XE#6703]) -> [PASS][94] +91 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_vm@bind-once.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][95] ([Intel XE#6676]) -> [FAIL][96] ([Intel XE#5993] / [Intel XE#6676])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][97] ([Intel XE#6703]) -> [SKIP][98] ([Intel XE#2327]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#1124]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#367])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#3432])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][105] ([Intel XE#6703]) -> [SKIP][106] ([Intel XE#2887]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#2252])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][109] ([Intel XE#2341]) -> [FAIL][110] ([Intel XE#1178])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#2320]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][113] ([Intel XE#2312]) -> [SKIP][114] ([Intel XE#2311]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#4141]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][117] ([Intel XE#2312]) -> [SKIP][118] ([Intel XE#4141]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#2311]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][121] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][122] ([Intel XE#2311])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#2313]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2312]) -> [SKIP][126] ([Intel XE#2313]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][127] ([Intel XE#3544]) -> [SKIP][128] ([Intel XE#3374] / [Intel XE#3544])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#2486])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][131] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][132] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][133] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][134] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          [SKIP][135] ([Intel XE#6703]) -> [SKIP][136] ([Intel XE#6503])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][137] ([Intel XE#2509]) -> [SKIP][138] ([Intel XE#2426])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#1499])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_vrr@flip-basic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#4837] / [Intel XE#6665])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_eudebug_online@interrupt-all.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2322]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#4943]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#2245])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#944])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8665 -> IGTPW_14203

  IGTPW_14203: 68f800ed332fdd1ab591e4b5dacc18963d55feaa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8665: 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4233-747b644466234c4933394bc6f4a13dafe87ae227: 747b644466234c4933394bc6f4a13dafe87ae227

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/index.html

--===============8039068862032257734==
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
<tr><td><b>Series:</b></td><td>intel-ci: remove few i915 symlinks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158863/">https://patchwork.freedesktop.org/series/158863/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8665_FULL -&gt; XEIGTPW_14203_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14203_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14203_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14203_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_multi_queue@two-queues-basic-smem:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8665_FULL and XEIGTPW_14203_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_chamelium_frames:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14203_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@xe_sriov_vram@vf-access-after-resize-down.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_sriov_vram@vf-access-after-resize-down.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@core_hotunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@xe_exec_system_allocator@twice-large-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_vm@bind-once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@xe_vm@bind-once.html">PASS</a> +91 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-5/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8665 -&gt; IGTPW_14203</li>
</ul>
<p>IGTPW_14203: 68f800ed332fdd1ab591e4b5dacc18963d55feaa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8665: 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4233-747b644466234c4933394bc6f4a13dafe87ae227: 747b644466234c4933394bc6f4a13dafe87ae227</p>

</body>
</html>

--===============8039068862032257734==--
