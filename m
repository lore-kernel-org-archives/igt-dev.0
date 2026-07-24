Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2401C531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 08:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FDD10F339;
	Fri, 24 Jul 2026 08:13:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9188910F339;
 Fri, 24 Jul 2026 08:13:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4653659029199004323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_lib/igt=5Fkms=3A_Fix_plane?=
 =?utf-8?q?_type_check_in_igt=5Fcrtc=5Fget=5Fplane=5Ftype_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jing-Ping Jan" <jingpingjan@google.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 Jul 2026 08:13:07 -0000
Message-ID: <178488078758.224279.6890796793789998112@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260706100626.1042084-1-jingpingjan@google.com>
In-Reply-To: <20260706100626.1042084-1-jingpingjan@google.com>
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

--===============4653659029199004323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Fix plane type check in igt_crtc_get_plane_type (rev6)
URL   : https://patchwork.freedesktop.org/series/169846/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9020_FULL -> XEIGTPW_15585_FULL
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

  Here are the changes found in XEIGTPW_15585_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#607] / [Intel XE#7361])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#3432]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325] / [Intel XE#7358])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#373])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#6969]) +10 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6974])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#309] / [Intel XE#7343])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1508])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#8265])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6126] / [Intel XE#776])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4141]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +23 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7905]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7061] / [Intel XE#7356])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +18 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7061])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6911] / [Intel XE#7378])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7283])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#8399])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2893] / [Intel XE#7304])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1489]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3904] / [Intel XE#7342])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1499])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8397])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6540] / [Intel XE#688])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][43] -> [INCOMPLETE][44] ([Intel XE#6321] / [Intel XE#8355])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7482]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-5/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#8374]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8374]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@one-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#8364])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-basic.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8364]) +10 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8369])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8378]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [PASS][53] -> [ABORT][54] ([Intel XE#8007]) +3 other tests abort
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          NOTRUN -> [ABORT][55] ([Intel XE#8007])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6964]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7793])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#7695])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4733] / [Intel XE#7417])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][60] ([Intel XE#6627] / [Intel XE#7419])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7892])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-5/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][62] ([Intel XE#301]) -> [PASS][63] +2 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][64] ([Intel XE#1503]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][66] ([Intel XE#7850]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [SKIP][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-5/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-4/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-6/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-6/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-1/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-9/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-9/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-9/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0:
    - shard-bmg:          [FAIL][117] ([Intel XE#8639]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:
    - shard-bmg:          [ABORT][119] ([Intel XE#8637]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          [FAIL][121] ([Intel XE#7992]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [ABORT][123] ([Intel XE#8591]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8637]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8637
  [Intel XE#8639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8639
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * IGT: IGT_9020 -> IGTPW_15585
  * Linux: xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004 -> xe-5466-2917ea6f91d2957b4c9fa73d4631ccdb6a650830

  IGTPW_15585: 15585
  IGT_9020: 9020
  xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004: 447a47cf86f97a1f5362d0675d65d129be27b004
  xe-5466-2917ea6f91d2957b4c9fa73d4631ccdb6a650830: 2917ea6f91d2957b4c9fa73d4631ccdb6a650830

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/index.html

--===============4653659029199004323==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Fix plane type check in igt_crt=
c_get_plane_type (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169846/">https://patchwork.freedesktop.org/series/169846/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15585/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15585/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9020_FULL -&gt; XEIGTPW_15585_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15585_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-g=
reen-only@pipe-b-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-g=
reen-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_dsc@dsc-with-formats-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
26">Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_frontbuffer_tracking@hdr-arg=
b161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">=
Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-lnl-5/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@kms_psr@fbc-pr-primary-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel=
 XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@kms_vrr@lobf-dc3co.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Int=
el XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@xe_evict@evict-beng-small-multi-=
vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
585/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321"=
>Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-5/igt@xe_exec_balancer@once-cm-virtual=
-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-q=
ueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-q=
ueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-ba=
sic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_exec_reset@multi-queue-cat-er=
ror-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_device_probe_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@xe_fault_injection@inject-f=
ault-probe-function-xe_device_probe_early.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +3 =
other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_fault_injection@vm-create-fai=
l-xe_vm_create_scratch.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/769=
5">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@xe_survivability@runtime-surviva=
bility.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-lnl-5/igt@xe_vm@overcommit-fault-vram-lr-n=
o-overcommit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15585/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/sha=
rd-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-=
threads.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7850">Intel XE#7850</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_exec_reset@long-spin-re=
use-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9020/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9020/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9020/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_9020/shard-bmg-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-10/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/=
shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-7/igt@xe_module_load@load=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9=
020/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_9020/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_9020/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_9020/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9020/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_9020/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#245=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405=
">Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15585/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_155=
85/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15585/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-9/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15585/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15585/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15585/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe=
_engine_class_video_enhance0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8639">Intel XE#8639</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_pm=
u@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_=
enhance1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe=
_engine_class_video_enhance1.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8637">Intel XE#8637</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-5/igt@xe_p=
mu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-10/igt@xe_sriov_auto_provisioning@exclusive-ranges@num=
vfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15585/shard-bmg-6/igt@xe_sriov_auto_provision=
ing@exclusive-ranges@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9020/shard-bmg-5/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">Intel XE#8591=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1558=
5/shard-bmg-1/igt@xe_wedged@basic-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9020 -&gt; IGTPW_15585</li>
<li>Linux: xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004 -&gt; xe-5466-2=
917ea6f91d2957b4c9fa73d4631ccdb6a650830</li>
</ul>
<p>IGTPW_15585: 15585<br />
  IGT_9020: 9020<br />
  xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004: 447a47cf86f97a1f5362d06=
75d65d129be27b004<br />
  xe-5466-2917ea6f91d2957b4c9fa73d4631ccdb6a650830: 2917ea6f91d2957b4c9fa73=
d4631ccdb6a650830</p>

</body>
</html>

--===============4653659029199004323==--
