Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE0AC44532
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 16:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D2210EE51;
	Wed, 22 Jul 2026 16:03:37 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87E710E485;
 Wed, 22 Jul 2026 16:03:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2749463201367961665=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_tools/amd=5Fhdmi=5Fcompliance=3A_Add_FRL_Test_Support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Fangzhi Zuo" <jerry.zuo@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jul 2026 16:03:06 -0000
Message-ID: <178473618687.216320.1315985186015896020@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721195612.25545-1-jerry.zuo@amd.com>
In-Reply-To: <20260721195612.25545-1-jerry.zuo@amd.com>
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

--===============2749463201367961665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tools/amd_hdmi_compliance: Add FRL Test Support
URL   : https://patchwork.freedesktop.org/series/170847/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9017_FULL -> XEIGTPW_15577_FULL
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

  Here are the changes found in XEIGTPW_15577_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2370])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#1231])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +10 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7679]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +12 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2724] / [Intel XE#7449])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7358])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#6974])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2390] / [Intel XE#6974])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7642])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321] / [Intel XE#7355])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1508])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#8265]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2374] / [Intel XE#6127])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +42 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7399]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4141]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2313]) +42 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2486])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7283]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8076])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#5021] / [Intel XE#7377])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#5020] / [Intel XE#7348])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#8399])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#3309] / [Intel XE#7368])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2505] / [Intel XE#7447])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1489]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#6503]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1499])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8397])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6599])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8374]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8364]) +21 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#7956]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8369])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8378]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6281] / [Intel XE#7426])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [PASS][51] -> [ABORT][52] ([Intel XE#8007]) +1 other test abort
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2833])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6964]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7793])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2284] / [Intel XE#7370])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#944])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][59] ([Intel XE#6627] / [Intel XE#7419])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][60] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][62] ([Intel XE#301]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [ABORT][64] ([Intel XE#8007]) -> [PASS][65] +2 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [SKIP][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-9/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-1/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-3/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-1/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-6/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-7/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-5/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-5/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-9/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-10/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-10/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-4/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-8/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-6/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [FAIL][116] ([Intel XE#7992]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt0-rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt0-rcs0.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          [FAIL][118] ([Intel XE#8340]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][120] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][121] ([Intel XE#3544])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-lnl:          [SKIP][122] ([Intel XE#8395]) -> [SKIP][123] ([Intel XE#8395] / [Intel XE#8396]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-lnl-4/igt@kms_pm_dc@dc3co-framedrop-check.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-lnl-4/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          [SKIP][124] ([Intel XE#8395]) -> [SKIP][125] ([Intel XE#8395] / [Intel XE#8396]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8340
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9017 -> IGTPW_15577
  * Linux: xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e -> xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c

  IGTPW_15577: 15577
  IGT_9017: 9017
  xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e: 15b41fd8ef085dbf5b64fe5819415f20bd61983e
  xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c: 5726f9c4bde0290e5e60e636b9632bb03a57498c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/index.html

--===============2749463201367961665==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tools/amd_hdmi_co=
mpliance: Add FRL Test Support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170847/">https://patchwork.freedesktop.org/series/170847/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15577/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15577/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9017_FULL -&gt; XEIGTPW_15577_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15577_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15577/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4=
-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
24">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_content_protection@legacy-hd=
cp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-arg=
b161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +42 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
6">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-l=
nl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-lnl-6/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@kms_vrr@flip-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@kms_vrr@lobf-dc3co.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Int=
el XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_exec_fault_mode@many-execque=
ues-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +21 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15577/shard-bmg-6/igt@xe_exec_reset@long-spin-many-preempt-gt0-thread=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7956">Intel XE#7956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_exec_reset@multi-queue-close-=
execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_exec_threads@threads-multi-qu=
eue-cm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@xe_fault_injection@exec-queue-cr=
eate-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wopcm_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_fault_injection@inject-fault-pro=
be-function-xe_wopcm_init.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort=
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
3">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-c=
onflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-9/igt@xe_page_reclaim@binds-full-pd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_survivability@runtime-surviva=
bility.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@=
kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15577/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_fault_inject=
ion@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> +2 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9017/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9017/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9017/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9017/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9017/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9017/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9017/shard-bmg-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/sh=
ard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_901=
7/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
9017/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_9017/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9017/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9017/shard-bmg-6/igt@xe_modul=
e_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15577/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shar=
d-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15577/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15577/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15577/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bm=
g-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-10/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1557=
7/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15577/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15577/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15577/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5577/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15577/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-ran=
dom-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low=
-priority@numvfs-random-gt0-rcs0.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@x=
e_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt0-=
rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-ran=
dom-gt1-vcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low=
-priority@numvfs-random-gt1-vcs0.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8340">Intel XE#8340</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15577/shard-bmg-7/igt@x=
e_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-=
vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15577/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-lnl-4/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel =
XE#8395</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15577/shard-lnl-4/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE=
#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8396">Intel XE#8396</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9017/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#=
8395</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15577/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396"=
>Intel XE#8396</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9017 -&gt; IGTPW_15577</li>
<li>Linux: xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e -&gt; xe-5453-5=
726f9c4bde0290e5e60e636b9632bb03a57498c</li>
</ul>
<p>IGTPW_15577: 15577<br />
  IGT_9017: 9017<br />
  xe-5448-15b41fd8ef085dbf5b64fe5819415f20bd61983e: 15b41fd8ef085dbf5b64fe5=
819415f20bd61983e<br />
  xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c: 5726f9c4bde0290e5e60e63=
6b9632bb03a57498c</p>

</body>
</html>

--===============2749463201367961665==--
