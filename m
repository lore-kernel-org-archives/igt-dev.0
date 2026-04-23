Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85983FDEE4E
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 21:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BB810F2D0;
	Thu, 23 Apr 2026 21:32:08 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921110F2C8;
 Thu, 23 Apr 2026 21:31:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5434550612345267925=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_attachments_support_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Apr 2026 21:31:54 -0000
Message-ID: <177697991481.4335.10151818686566264100@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
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

--===============5434550612345267925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add attachments support (rev2)
URL   : https://patchwork.freedesktop.org/series/165230/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8870_FULL -> XEIGTPW_15047_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15047_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15047_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15047_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-bmg:          [PASS][2] -> [FAIL][3] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f}:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  
New tests
---------

  New tests have been introduced between XEIGT_8870_FULL and XEIGTPW_15047_FULL:

### New IGT tests (2) ###

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.82] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15047_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#7725]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@core_hotunplug@hotunbind-rebind.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1125] / [Intel XE#7312])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#6703]) +16 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7059] / [Intel XE#7085])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7642])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4354] / [Intel XE#5882])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4354] / [Intel XE#5870])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1421])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-bmg:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#3372] / [Intel XE#5208] / [Intel XE#7725])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7179])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +8 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312] / [Intel XE#651])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +9 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2352] / [Intel XE#7399])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2350] / [Intel XE#7503])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#1503])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1503])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7283])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7283])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#7340])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2893] / [Intel XE#7304])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1489]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#3904] / [Intel XE#7342])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6503])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1447] / [Intel XE#7469])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6599])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7636]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_eudebug_online@pagefault-write.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7636])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7482]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-4/igt@xe_exec_balancer@twice-cm-parallel-rebind.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][56] ([Intel XE#5545] / [Intel XE#6652])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7136]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7136])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-3/igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#6874]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6874]) +22 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#6703]) +89 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7138]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7138])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#7736]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6964]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7590])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4733] / [Intel XE#7417])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#944])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#944]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7569])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-5/igt@xe_sriov_flr@flr-basic.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][74] ([Intel XE#7084]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][76] ([Intel XE#7571]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [FAIL][78] ([Intel XE#3149] / [Intel XE#7705]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][80] ([Intel XE#7705]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check@ad-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check@ad-dp2-hdmi-a3.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [DMESG-WARN][82] -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  * igt@xe_configfs@engines-allowed:
    - shard-bmg:          [ABORT][84] -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@xe_configfs@engines-allowed.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@xe_configfs@engines-allowed.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][86] ([Intel XE#6321]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][88] ([Intel XE#6569]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][90] ([Intel XE#2327]) -> [SKIP][91] ([Intel XE#6703])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][92] ([Intel XE#1124]) -> [SKIP][93] ([Intel XE#6703]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][94] ([Intel XE#3432]) -> [SKIP][95] ([Intel XE#6703])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][96] ([Intel XE#2887]) -> [SKIP][97] ([Intel XE#6703])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][98] ([Intel XE#2320]) -> [SKIP][99] ([Intel XE#6703]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][100] ([Intel XE#2320]) -> [SKIP][101] ([Intel XE#6557] / [Intel XE#6703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][102] ([Intel XE#1508]) -> [SKIP][103] ([Intel XE#6703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][104] ([Intel XE#2244]) -> [SKIP][105] ([Intel XE#6703])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][106] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][107] ([Intel XE#6703])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-bmg:          [SKIP][108] ([Intel XE#2311]) -> [SKIP][109] ([Intel XE#6703]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][110] ([Intel XE#4141]) -> [SKIP][111] ([Intel XE#6703]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][112] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][113] ([Intel XE#6703])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][114] ([Intel XE#2313]) -> [SKIP][115] ([Intel XE#6703]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-bmg:          [SKIP][116] ([Intel XE#7283]) -> [SKIP][117] ([Intel XE#6703])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][118] ([Intel XE#2938] / [Intel XE#7376]) -> [SKIP][119] ([Intel XE#6703])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][120] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][122] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][123] ([Intel XE#6703]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@kms_psr@psr2-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][124] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][125] ([Intel XE#2426] / [Intel XE#5848])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          [SKIP][126] ([Intel XE#7636]) -> [SKIP][127] ([Intel XE#6703]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][128] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][129] ([Intel XE#6703]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][130] ([Intel XE#7136]) -> [SKIP][131] ([Intel XE#6703]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          [SKIP][132] ([Intel XE#6874]) -> [SKIP][133] ([Intel XE#6703]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][134] ([Intel XE#7138]) -> [SKIP][135] ([Intel XE#6703])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          [SKIP][136] ([Intel XE#2229]) -> [FAIL][137] ([Intel XE#7736])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [SKIP][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [DMESG-WARN][169], [DMESG-WARN][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [DMESG-WARN][187], [PASS][188]) ([Intel XE#7725])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-5/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-8/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][189] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][190] ([Intel XE#6703])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][191] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][192] ([Intel XE#6703])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][193] ([Intel XE#5545] / [Intel XE#7725]) -> [DMESG-WARN][194] ([Intel XE#5545])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3372
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8870 -> IGTPW_15047
  * Linux: xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd -> xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41

  IGTPW_15047: 33cac6725cd1f70c29748a01204892eae24b4e53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd: 489e26ada57ce96a2ee3e5853cfe74981ef85bbd
  xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41: 95fbbe4877e1543975d0d0f18a7cc0074416be41

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/index.html

--===============5434550612345267925==
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
<tr><td><b>Series:</b></td><td>Add attachments support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165230/">https://patchwork.freedesktop.org/series/165230/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15047/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15047/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8870_FULL -&gt; XEIGTPW_15047_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15047_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15047_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
047_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
047/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> =
+2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pi=
pe-a-hdmi-a-3-xrgb16161616f.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8870_FULL and XEIGTPW_15047=
_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-c-hdmi-a-3:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-d-hdmi-a-3:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.82] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15047_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard=
-bmg-6/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a=
>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-5/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"=
>Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_addfb_basic@bad-pitch-999.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotat=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-1/igt@kms_ccs@bad-aux-stride-yf-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-stres=
s-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_content_protection@uevent.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen=
-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard=
-bmg-6/igt@kms_flip@modeset-vs-vblank-race.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3372">Intel XE#3372</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">In=
tel XE#5208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@=
kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-=
dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-3/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_sharpness_filter@filter-stre=
ngth.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7469">Intel XE#7469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_eudebug_online@pagefault-writ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7636">Intel XE#7636</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-7/igt@xe_eudebug_online@pagefault-writ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-4/igt@xe_exec_balancer@twice-cm-parall=
el-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_balancer@twice-cm-virtua=
l-userptr-invalidate.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-qu=
eue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-3/igt@xe_exec_fault_mode@twice-multi-q=
ueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-p=
riority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6874">Intel XE#6874</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-m=
map-new.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_system_allocator@many-large-exec=
queues-mmap-new.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@xe_exec_threads@threads-multi-qu=
eue-cm-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-1/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@x=
e_live_ktest@xe_bo.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7736">Intel XE#7736</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_pat@l2-flush-opt-svm-pat-rest=
rict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_pxp@pxp-optout.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Inte=
l XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-8/igt@xe_query@multigpu-query-gt-list.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-lnl-5/igt@xe_sriov_flr@flr-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569"=
>Intel XE#7569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7084">Intel XE#7084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571=
">Intel XE#7571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15047/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel X=
E#3149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7705">Intel XE#7705</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check@ad-dp2-hdmi-a3.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7705">Intel XE#7705</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15047/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check@ad-dp=
2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-=
plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@p=
ipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-lnl-2/igt@kms_=
sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-=
filter.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-2/igt@xe_configfs@engines-allowed.html">ABORT</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bm=
g-10/igt@xe_configfs@engines-allowed.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel =
XE#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15047/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">I=
ntel XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15047/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15047/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15047/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-256x85.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2320">Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel X=
E#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15047/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#22=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
047/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprima=
ry.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-i=
ndfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer=
_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/728=
3">Intel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15047/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938"=
>Intel XE#2938</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7376">Intel XE#7376</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"=
>Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@k=
ms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15047/shard-bmg-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7424">Intel XE#7424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#76=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
047/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-use=
rptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt=
@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-inva=
lidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_fault_mode@once=
-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">I=
ntel XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15047/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-fd-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_exec_threads@=
threads-multi-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/222=
9">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15047/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7736">Intel XE#7736</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8870/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8870/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_8870/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8870/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8870/shard-bmg-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-=
bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-8/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_88=
70/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8870/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8870/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8870/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/shard-bmg-10/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8870/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#245=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405=
">Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15047/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
47/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15047/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/=
shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15047/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15047/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5047/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15047/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15047/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/sh=
ard-bmg-10/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-9/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel X=
E#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7370">Intel XE#7370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15047/shard-bmg-2/igt@xe_pxp@pxp-terminati=
on-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8870/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">=
Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7725">Intel XE#7725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15047/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeou=
t.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8870 -&gt; IGTPW_15047</li>
<li>Linux: xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd -&gt; xe-4928-9=
5fbbe4877e1543975d0d0f18a7cc0074416be41</li>
</ul>
<p>IGTPW_15047: 33cac6725cd1f70c29748a01204892eae24b4e53 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd: 489e26ada57ce96a2ee3e58=
53cfe74981ef85bbd<br />
  xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41: 95fbbe4877e1543975d0d0f=
18a7cc0074416be41</p>

</body>
</html>

--===============5434550612345267925==--
