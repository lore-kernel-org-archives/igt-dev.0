Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DED4CD6E57
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 00:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE9C1124EC;
	Thu,  4 Jun 2026 00:28:38 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700201124EC;
 Thu,  4 Jun 2026 00:28:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0954959422717275743=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_lib/igt=5Fkms=3A_treat_equ?=
 =?utf-8?q?al_limits_as_bigjoiner?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jun 2026 00:28:14 -0000
Message-ID: <178053289444.41774.6350417625969544082@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603073606.2168574-1-jeevan.b@intel.com>
In-Reply-To: <20260603073606.2168574-1-jeevan.b@intel.com>
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

--===============0954959422717275743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: treat equal limits as bigjoiner
URL   : https://patchwork.freedesktop.org/series/167803/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8947_FULL -> XEIGTPW_15295_FULL
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

  Here are the changes found in XEIGTPW_15295_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2370])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652]) +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325] / [Intel XE#7358])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6974])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-10/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2320]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#7809])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1508])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4156] / [Intel XE#7425])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1138] / [Intel XE#7344])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#3098]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#301])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7178] / [Intel XE#7349])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +28 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +32 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7922]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#7915]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-9/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7283]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2393])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#5020] / [Intel XE#7348])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#7340])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1489]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7795])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6503])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7636]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7140])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7136]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6874]) +15 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7866])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][48] ([Intel XE#7098] / [Intel XE#8159])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-lnl:          [PASS][49] -> [ABORT][50] ([Intel XE#8007])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7138]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2229])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6964])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7793])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#7695])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7590]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@xe_peer2peer@read.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2284] / [Intel XE#7370])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#6569])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#6569])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][62] ([Intel XE#7571]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][64] ([Intel XE#301]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][66] ([Intel XE#7308]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][68] ([Intel XE#7915]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][70] ([Intel XE#7340] / [Intel XE#7504]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][72] ([Intel XE#7340]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][74] ([Intel XE#6569]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * IGT: IGT_8947 -> IGTPW_15295
  * Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -> xe-5192-eb42f7e0ec818a6be55482d88145d757acf3e093

  IGTPW_15295: 15295
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc
  xe-5192-eb42f7e0ec818a6be55482d88145d757acf3e093: eb42f7e0ec818a6be55482d88145d757acf3e093

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/index.html

--===============0954959422717275743==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: treat equal limits as bigjoiner</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167803/">https://patchwork.freedesktop.org/series/167803/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8947_FULL -&gt; XEIGTPW_15295_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15295_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-dp-2-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-9/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-1/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-9/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-4/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8947/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15295/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8947 -&gt; IGTPW_15295</li>
<li>Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -&gt; xe-5192-eb42f7e0ec818a6be55482d88145d757acf3e093</li>
</ul>
<p>IGTPW_15295: 15295<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc<br />
  xe-5192-eb42f7e0ec818a6be55482d88145d757acf3e093: eb42f7e0ec818a6be55482d88145d757acf3e093</p>

</body>
</html>

--===============0954959422717275743==--
