Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B1FC54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 16:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F2410F34A;
	Fri, 31 Jul 2026 16:37:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C072810F34A;
 Fri, 31 Jul 2026 16:37:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7369501859860980684=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_gem=5Fwsim=3A_fix_batch_pr?=
 =?utf-8?q?emature_completion_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jul 2026 16:37:18 -0000
Message-ID: <178551583877.10200.1374160901331884408@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
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

--===============7369501859860980684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_wsim: fix batch premature completion (rev2)
URL   : https://patchwork.freedesktop.org/series/171174/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9035_FULL -> XEIGTPW_15618_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15618_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#8714]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@core_getversion@basic.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2134]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@fbdev@write.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7679])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#6507])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6974])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7642])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +4 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#6707] / [Intel XE#7439])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#8265]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2374] / [Intel XE#6128])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#301])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8714]) +143 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7061]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4141]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +12 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +21 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6901])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7591])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8303]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#8395] / [Intel XE#8396])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8396]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check@psr2-yuv420.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7794])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1489])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2387] / [Intel XE#7429])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6503])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6599])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8370])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8374]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8364]) +11 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8369]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8378]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [PASS][50] -> [ABORT][51] ([Intel XE#8007]) +1 other test abort
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2229])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) -> ([PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [SKIP][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103]) ([Intel XE#2457] / [Intel XE#7405])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-3/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#6964])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1420] / [Intel XE#7590])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#7590])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#944])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#8714]) +778 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@xe_spin_batch@spin-all.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [ABORT][110] ([Intel XE#8007]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-3/igt@core_hotunplug@unplug-rescan.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][112] ([Intel XE#2134]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@fbdev@nullptr.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@fbdev@nullptr.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][114] ([Intel XE#301]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][116] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [SKIP][118] ([Intel XE#8714]) -> [PASS][119] +671 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][120] ([Intel XE#8399]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_pat@pt-caching-update-pat-and-pte:
    - shard-bmg:          [DMESG-WARN][122] ([Intel XE#8300]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@xe_pat@pt-caching-update-pat-and-pte.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@xe_pat@pt-caching-update-pat-and-pte.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][124] ([Intel XE#6569]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][126] ([Intel XE#8714]) -> [SKIP][127] ([Intel XE#2327]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][128] ([Intel XE#2327]) -> [SKIP][129] ([Intel XE#8714]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][130] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][131] ([Intel XE#8714]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][132] ([Intel XE#8714]) -> [SKIP][133] ([Intel XE#7059] / [Intel XE#7085])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][134] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][135] ([Intel XE#8714])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][136] ([Intel XE#8714]) -> [SKIP][137] ([Intel XE#1124]) +10 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][138] ([Intel XE#1124]) -> [SKIP][139] ([Intel XE#8714]) +11 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][140] ([Intel XE#8714]) -> [SKIP][141] ([Intel XE#2328] / [Intel XE#7367])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][142] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][143] ([Intel XE#8714])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][144] ([Intel XE#8714]) -> [SKIP][145] ([Intel XE#7679])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][146] ([Intel XE#367]) -> [SKIP][147] ([Intel XE#8714]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][148] ([Intel XE#8714]) -> [SKIP][149] ([Intel XE#367]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][150] ([Intel XE#2887]) -> [SKIP][151] ([Intel XE#8714]) +12 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][152] ([Intel XE#8714]) -> [SKIP][153] ([Intel XE#2887]) +13 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][154] ([Intel XE#3432]) -> [SKIP][155] ([Intel XE#8714]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][156] ([Intel XE#8714]) -> [SKIP][157] ([Intel XE#3432]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][158] ([Intel XE#8714]) -> [SKIP][159] ([Intel XE#2724] / [Intel XE#7449])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          [SKIP][160] ([Intel XE#2252]) -> [SKIP][161] ([Intel XE#8714]) +9 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][162] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][163] ([Intel XE#8714]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][164] ([Intel XE#8714]) -> [SKIP][165] ([Intel XE#2325] / [Intel XE#7358])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][166] ([Intel XE#7358]) -> [SKIP][167] ([Intel XE#8714]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][168] ([Intel XE#8714]) -> [SKIP][169] ([Intel XE#7358]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][170] ([Intel XE#8714]) -> [SKIP][171] ([Intel XE#2252]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][172] ([Intel XE#8714]) -> [FAIL][173] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_content_protection@atomic.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][174] ([Intel XE#8714]) -> [SKIP][175] ([Intel XE#2390] / [Intel XE#6974])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][176] ([Intel XE#6974]) -> [SKIP][177] ([Intel XE#8714]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][178] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][179] ([Intel XE#8714])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][180] ([Intel XE#7642]) -> [SKIP][181] ([Intel XE#8714])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_content_protection@type1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [SKIP][182] ([Intel XE#8714]) -> [FAIL][183] ([Intel XE#6707] / [Intel XE#7439])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][184] ([Intel XE#8714]) -> [SKIP][185] ([Intel XE#2320]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][186] ([Intel XE#8714]) -> [SKIP][187] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][188] ([Intel XE#2320]) -> [SKIP][189] ([Intel XE#8714]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][190] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][191] ([Intel XE#8714])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][192] ([Intel XE#7571]) -> [SKIP][193] ([Intel XE#8714])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][194] ([Intel XE#8714]) -> [FAIL][195] ([Intel XE#7571])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][196] ([Intel XE#8714]) -> [SKIP][197] ([Intel XE#2286] / [Intel XE#6035])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][198] ([Intel XE#8714]) -> [SKIP][199] ([Intel XE#4210] / [Intel XE#7467])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][200] ([Intel XE#8714]) -> [SKIP][201] ([Intel XE#1508])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][202] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][203] ([Intel XE#8714])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][204] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][205] ([Intel XE#8714])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][206] ([Intel XE#8265]) -> [SKIP][207] ([Intel XE#8714]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][208] ([Intel XE#8714]) -> [SKIP][209] ([Intel XE#8265])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][210] ([Intel XE#8714]) -> [SKIP][211] ([Intel XE#4422] / [Intel XE#7442])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][212] ([Intel XE#8680]) -> [SKIP][213] ([Intel XE#8714])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][214] ([Intel XE#8714]) -> [SKIP][215] ([Intel XE#2373] / [Intel XE#7448])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][216] ([Intel XE#8714]) -> [SKIP][217] ([Intel XE#2375])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          [SKIP][218] ([Intel XE#8714]) -> [SKIP][219] ([Intel XE#8586])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@dsc.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][220] ([Intel XE#8714]) -> [SKIP][221] ([Intel XE#2374] / [Intel XE#6127])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][222] ([Intel XE#8714]) -> [SKIP][223] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][224] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][225] ([Intel XE#8714]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][226] ([Intel XE#7179]) -> [SKIP][227] ([Intel XE#8714])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][228] ([Intel XE#8714]) -> [SKIP][229] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][230] ([Intel XE#4141]) -> [SKIP][231] ([Intel XE#8714]) +20 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][232] ([Intel XE#8714]) -> [SKIP][233] ([Intel XE#4141]) +14 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][234] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][235] ([Intel XE#8714]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][236] ([Intel XE#2311]) -> [SKIP][237] ([Intel XE#8714]) +66 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][238] ([Intel XE#8714]) -> [SKIP][239] ([Intel XE#2311]) +58 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][240] ([Intel XE#7061]) -> [SKIP][241] ([Intel XE#8714]) +8 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          [SKIP][242] ([Intel XE#7399]) -> [SKIP][243] ([Intel XE#8714])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][244] ([Intel XE#8714]) -> [SKIP][245] ([Intel XE#2350] / [Intel XE#7503])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][246] ([Intel XE#2313]) -> [SKIP][247] ([Intel XE#8714]) +72 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][248] ([Intel XE#8714]) -> [SKIP][249] ([Intel XE#2313]) +58 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][250] ([Intel XE#8714]) -> [SKIP][251] ([Intel XE#7061]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][252] ([Intel XE#8714]) -> [SKIP][253] ([Intel XE#6901])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][254] ([Intel XE#8714]) -> [SKIP][255] ([Intel XE#4298] / [Intel XE#5873])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][256] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][257] ([Intel XE#8714]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][258] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][259] ([Intel XE#8714])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][260] ([Intel XE#8714]) -> [SKIP][261] ([Intel XE#2486]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_panel_fitting@legacy.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][262] ([Intel XE#8714]) -> [SKIP][263] ([Intel XE#7283]) +6 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][264] ([Intel XE#7283]) -> [SKIP][265] ([Intel XE#8714]) +6 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][266] ([Intel XE#8714]) -> [SKIP][267] ([Intel XE#2393]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][268] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][269] ([Intel XE#8714])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][270] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][271] ([Intel XE#8714])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][272] ([Intel XE#8714]) -> [SKIP][273] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][274] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][275] ([Intel XE#8714])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][276] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][277] ([Intel XE#8714])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][278] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][279] ([Intel XE#8714]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][280] ([Intel XE#8714]) -> [SKIP][281] ([Intel XE#8395] / [Intel XE#8396])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][282] ([Intel XE#8714]) -> [SKIP][283] ([Intel XE#6927])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][284] ([Intel XE#7794]) -> [SKIP][285] ([Intel XE#8714])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][286] ([Intel XE#8714]) -> [SKIP][287] ([Intel XE#2505] / [Intel XE#7447])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][288] ([Intel XE#8714]) -> [SKIP][289] ([Intel XE#2499])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][290] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][291] ([Intel XE#8714]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][292] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [SKIP][293] ([Intel XE#8714])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][294] ([Intel XE#8714]) -> [SKIP][295] ([Intel XE#6814] / [Intel XE#7428])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][296] ([Intel XE#1489]) -> [SKIP][297] ([Intel XE#8714]) +7 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][298] ([Intel XE#8714]) -> [SKIP][299] ([Intel XE#1489]) +11 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][300] ([Intel XE#8714]) -> [SKIP][301] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_psr@fbc-psr-suspend.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][302] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][303] ([Intel XE#8714]) +15 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_psr@psr2-primary-page-flip.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][304] ([Intel XE#7795]) -> [SKIP][305] ([Intel XE#8714])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][306] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][307] ([Intel XE#8714]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][308] ([Intel XE#8714]) -> [SKIP][309] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][310] ([Intel XE#8714]) -> [SKIP][311] ([Intel XE#1435] / [Intel XE#8695])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          [SKIP][312] ([Intel XE#6503]) -> [SKIP][313] ([Intel XE#8714]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][314] ([Intel XE#8714]) -> [SKIP][315] ([Intel XE#6503]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][316] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][317] ([Intel XE#8714])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][318] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][319] ([Intel XE#8714])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][320] ([Intel XE#8714]) -> [SKIP][321] ([Intel XE#2450] / [Intel XE#5857])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][322] ([Intel XE#1499]) -> [SKIP][323] ([Intel XE#8714]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][324] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][325] ([Intel XE#8714])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@kms_vrr@lobf.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][326] ([Intel XE#8714]) -> [SKIP][327] ([Intel XE#1499]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@kms_vrr@max-min.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_vrr@max-min.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][328] ([Intel XE#8608]) -> [SKIP][329] ([Intel XE#8714])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@xe_cw_post_sync@walker-post-sync.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][330] ([Intel XE#8714]) -> [SKIP][331] ([Intel XE#8370]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          [SKIP][332] ([Intel XE#8370]) -> [SKIP][333] ([Intel XE#8714])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][334] ([Intel XE#8714]) -> [SKIP][335] ([Intel XE#2322] / [Intel XE#7372]) +10 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][336] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][337] ([Intel XE#8714]) +11 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][338] ([Intel XE#8714]) -> [SKIP][339] ([Intel XE#8374]) +12 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][340] ([Intel XE#8374]) -> [SKIP][341] ([Intel XE#8714]) +17 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-execs-basic-smem:
    - shard-bmg:          [SKIP][342] ([Intel XE#8364]) -> [SKIP][343] ([Intel XE#8714]) +34 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-basic-smem.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][344] ([Intel XE#8714]) -> [SKIP][345] ([Intel XE#8364]) +25 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][346] ([Intel XE#8369]) -> [SKIP][347] ([Intel XE#8714]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][348] ([Intel XE#7850]) -> [SKIP][349] ([Intel XE#8714])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          [SKIP][350] ([Intel XE#8714]) -> [SKIP][351] ([Intel XE#8369]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_exec_reset@multi-queue-cancel.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          [SKIP][352] ([Intel XE#8714]) -> [SKIP][353] ([Intel XE#8378]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          [SKIP][354] ([Intel XE#8378]) -> [SKIP][355] ([Intel XE#8714]) +8 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][356] ([Intel XE#8714]) -> [SKIP][357] ([Intel XE#6281] / [Intel XE#7426])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][358] ([Intel XE#8714]) -> [SKIP][359] ([Intel XE#7954])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          [SKIP][360] ([Intel XE#6964]) -> [SKIP][361] ([Intel XE#6964] / [Intel XE#8714]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          [SKIP][362] ([Intel XE#6964] / [Intel XE#8714]) -> [SKIP][363] ([Intel XE#6964]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          [SKIP][364] ([Intel XE#8714]) -> [SKIP][365] ([Intel XE#7793]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_page_reclaim@binds-null-vma.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][366] ([Intel XE#7793]) -> [SKIP][367] ([Intel XE#8714]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][368] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][369] ([Intel XE#8714])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [SKIP][370] ([Intel XE#8714]) -> [FAIL][371] ([Intel XE#7695])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][372] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][373] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8714]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6/igt@xe_peer2peer@write.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][374] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][375] ([Intel XE#8714]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][376] ([Intel XE#8714]) -> [SKIP][377] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_pm@d3hot-i2c.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][378] ([Intel XE#8714]) -> [SKIP][379] ([Intel XE#2284] / [Intel XE#7370])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][380] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517]) -> [SKIP][381] ([Intel XE#8714])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          [SKIP][382] ([Intel XE#7599]) -> [SKIP][383] ([Intel XE#8714])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          [SKIP][384] ([Intel XE#8714]) -> [SKIP][385] ([Intel XE#7599])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][386] ([Intel XE#8714]) -> [SKIP][387] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][388] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][389] ([Intel XE#8714])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][390] ([Intel XE#8714]) -> [SKIP][391] ([Intel XE#944])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_query@multigpu-query-invalid-query.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][392] ([Intel XE#944]) -> [SKIP][393] ([Intel XE#8714]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][394] ([Intel XE#8714]) -> [DMESG-WARN][395] ([Intel XE#5545])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9035 -> IGTPW_15618

  IGTPW_15618: 15618
  IGT_9035: 61674acebe1520ef02165573257f552366c2879c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/index.html

--===============7369501859860980684==
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
<tr><td><b>Series:</b></td><td>gem_wsim: fix batch premature completion (re=
v2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171174/">https://patchwork.freedesktop.org/series/171174/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15618/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15618/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9035_FULL -&gt; XEIGTPW_15618_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15618_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-10/igt@core_getversion@basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/ig=
t@core_getversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@fbdev@write.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@fbdev@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_big_fb@4-tiled-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3=
-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15618/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-aft=
er-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_chamelium_sharpness_filter@f=
ilter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_content_protection@suspend-r=
esume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) =
+4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_content_protection@uevent-hd=
cp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_feature_discovery@psr2.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15618/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +143 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr=
-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#=
6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check@=
pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check@=
psr2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Int=
el XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_psr@psr2-sprite-render.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_sharpness_filter@filter-scal=
er-downscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_evict@evict-threads-small-mul=
ti-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-qu=
eue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-pr=
iority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8364">Intel XE#8364</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_exec_threads@threads-multi-qu=
eue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_create.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15618/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind=
_ioctl_ops_create.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_vali=
date_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9035/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9035/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9035/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9035/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9035/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9035/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9=
035/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_9035/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_9035/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9035/shard-bmg-10/igt@xe_modul=
e_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15618/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15618/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15618/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shar=
d-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15618/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15618/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618=
/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15618/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">=
Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-p=
refetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_pat@xa-app-transient-media-of=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/ig=
t@xe_spin_batch@spin-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +778 other tests skip=
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-3/igt@core_hotunplug@unplug-rescan.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE=
#8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15618/shard-bmg-3/igt@core_hotunplug@unplug-rescan.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@fbdev@nullptr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg=
-6/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15618/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15618/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank=
@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5618/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +671 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shar=
d-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-update-pat-and-pte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@xe_pat@pt-caching-update-pat-and-pte.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
300">Intel XE#8300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15618/shard-bmg-10/igt@xe_pat@pt-caching-update-pat-and-pte.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel=
 XE#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Int=
el XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15618/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15618/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@line=
ar-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_big_fb@linear-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">=
Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7387">Intel XE#7387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_156=
18/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel =
XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/607">Intel XE#607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7361">Intel XE#7361</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_big_fb@yf-tiled-add=
fb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target=
-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_bw@connected-linea=
r-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-ta=
rget-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-=
target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15618/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_ccs@crc-primary-rotat=
ion-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs=
-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
8/shard-bmg-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#=
7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_chamelium_audio@dp-audio-after-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15618/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15618/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel =
XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-=
lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-o=
nly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@kms_chamelium_color_pipeline@p=
lane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15618/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15618/shard-bmg-9/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304=
">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15618/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-h=
dcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_content_protection@dp-mst-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#=
7642</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15618/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15618/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707=
">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15618/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15618/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">In=
tel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15618/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_cursor_crc@cursor-r=
apid-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571=
">Intel XE#7571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15618/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15618/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15618/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#421=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467=
">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15618/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#150=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7386">Intel XE#7386</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331"=
>Intel XE#4331</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7227">Intel XE#7227</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel X=
E#8265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15618/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
8/shard-bmg-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visib=
le-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dir=
ty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard=
-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel =
XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15618/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_156=
18/shard-bmg-3/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
618/shard-bmg-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Inte=
l XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@kms_flip_scaled=
_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351"=
>Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_=
flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-lin=
ear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_flip_scaled_crc@=
flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_frontbuffer_tracking@dr=
rs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +20 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer=
_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shr=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +66 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-=
cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-10/igt@kms_frontbuffe=
r_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@f=
bchdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/739=
9">Intel XE#7399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15618/shard-bmg-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +72 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_frontbuffer_=
tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5618/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15618/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE=
#4298</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7466">Intel XE#7466</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_joiner@invalid-mod=
eset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911=
">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7378">Intel XE#7378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
8/shard-bmg-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modi=
fier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@kms_plane@pix=
el-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#=
7283</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283=
">Intel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15618/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_156=
18/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel X=
E#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7377">Intel XE#7377</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_plane_scaling@pla=
nes-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-5/igt@kms_plane_scali=
ng@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Inte=
l XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_backlight@basic=
-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">=
Intel XE#2938</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7760">Intel XE#7760</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_backlight=
@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#839=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396=
">Intel XE#8396</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15618/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE=
#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15618/shard-bmg-5/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE=
#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard=
-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/sha=
rd-bmg-9/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/sh=
ard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Int=
el XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel =
XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7402">Intel XE#7402</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-uns=
et-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/s=
hard-bmg-1/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15618/shard-bmg-10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
8/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel X=
E#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7795">Intel XE#7795</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">=
Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_rotation_crc@primary-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15618/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-ref=
lect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15618/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">In=
tel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15618/shard-bmg-7/igt@kms_sharpness_filter@filter-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling=
-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15618/shard-bmg-3/igt@kms_sharpness_filter@invalid=
-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7424">Intel XE#7424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@kms_tiled_displa=
y@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15618/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2=
450</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
57">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/sh=
ard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#74=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
618/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-b=
mg-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-10/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Inte=
l XE#8608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15618/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_evict@evict-small-external-multi-q=
ueue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel=
 XE#8370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-7/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-8/igt@xe_exec_basic@multigp=
u-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#73=
72</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@x=
e_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15618/shard-bmg-2/igt@xe_exec_fault_mode@many-exe=
cqueues-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8374">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-=
userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-basic-smem.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
64">Intel XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-basic-sme=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8714">Intel XE#8714</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-faul=
t-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_exec_multi_queue@two=
-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +25 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error-on-second=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-c=
at-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-t=
hreads.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7850">Intel XE#7850</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_reset@long-spin-reu=
se-many-preempt-gt1-threads.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-6/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel =
XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15618/shard-bmg-6/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_exec_threads@=
threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp=
_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-4/igt@xe_fault_injection=
@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel=
 XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
8/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6964">Intel XE#6964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-acces=
s-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964=
">Intel XE#6964</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15618/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency=
-copy-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15618/shard-bmg-9/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7=
793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#77=
93</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
618/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590"=
>Intel XE#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15618/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15618/shard-bmg-10/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#=
7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-6/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel=
 XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_peer2peer@write.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
70">Intel XE#7370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15618/shard-b=
mg-6/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#740=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
618/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Inte=
l XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#57=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329=
">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7517">Intel XE#7517</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel=
 XE#7599</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15618/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15618/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault-svm.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599=
">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15618/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-p=
ost-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15618/shard-bmg-7/igt@xe_pxp@regular-src-to-pxp-=
dest-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_query@multigpu-query-invalid-query.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15618/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
4">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15618/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9035/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15618/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">In=
tel XE#5545</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9035 -&gt; IGTPW_15618</li>
</ul>
<p>IGTPW_15618: 15618<br />
  IGT_9035: 61674acebe1520ef02165573257f552366c2879c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6d=
a30550da6ea6cb03a</p>

</body>
</html>

--===============7369501859860980684==--
