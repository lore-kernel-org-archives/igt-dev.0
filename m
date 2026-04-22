Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8ADF94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A1510E02C;
	Wed, 22 Apr 2026 03:13:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD1210E02C;
 Wed, 22 Apr 2026 03:13:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5347509919211471210=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_attachments_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Apr 2026 03:13:21 -0000
Message-ID: <177682760137.484273.14718862134986269939@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
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

--===============5347509919211471210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add attachments support
URL   : https://patchwork.freedesktop.org/series/165230/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8865_FULL -> XEIGTPW_15026_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15026_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15026_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15026_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][1] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_pm@s4-mocs.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][4] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15026_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][6] ([Intel XE#7445])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#607] / [Intel XE#7361])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#7621])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7679]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367] / [Intel XE#7354]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][15] ([Intel XE#7084]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6974])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7642])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2320])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2321] / [Intel XE#7355])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1340] / [Intel XE#7435])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6126] / [Intel XE#776]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7178] / [Intel XE#7349])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7179])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +19 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4141]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +22 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6901])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7283]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#5020] / [Intel XE#7348])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#7340]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2499])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1489]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2387] / [Intel XE#7429])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1435])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6503]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2426] / [Intel XE#5848])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1499])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2142]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7636]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7140])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7136]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6874]) +18 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@eu-fault-4k-range-device-host:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#7592])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#5625])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:
    - shard-bmg:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#7725]) +3 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7138]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6281] / [Intel XE#7426])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88]) -> ([PASS][89], [PASS][90], [PASS][91], [PASS][92], [DMESG-WARN][93], [PASS][94], [DMESG-WARN][95], [DMESG-WARN][96], [PASS][97], [DMESG-WARN][98], [PASS][99], [SKIP][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#6964]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#7590])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2284] / [Intel XE#7370])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_prime_self_import@reimport-vs-gem_close-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][114] ([Intel XE#7725])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_prime_self_import@reimport-vs-gem_close-race.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4733] / [Intel XE#7417]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#944])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][117] ([Intel XE#6569])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#6569])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][120] ([Intel XE#7308]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][122] ([Intel XE#1503]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@xe_prime_self_import@export-vs-gem_close-race:
    - shard-bmg:          [DMESG-WARN][124] ([Intel XE#7725]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_prime_self_import@export-vs-gem_close-race.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_prime_self_import@export-vs-gem_close-race.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][126] ([Intel XE#6569]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [INCOMPLETE][128] ([Intel XE#2594] / [Intel XE#5643]) -> [SKIP][129] ([Intel XE#1124])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592
  [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8865 -> IGTPW_15026
  * Linux: xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469 -> xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169

  IGTPW_15026: f44bd271497d7be3c64eb606a8aa749110700776 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 898b5aa235c5b269d6c745fd84270b296aa75469
  xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a80249e26c78435f169

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/index.html

--===============5347509919211471210==
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
<tr><td><b>Series:</b></td><td>Add attachments support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165230/">https://patchwork.freedesktop.org/series/165230/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15026/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15026/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8865_FULL -&gt; XEIGTPW_15026_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15026_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15026_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
026_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-7/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_pm@s=
4-mocs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@atomic-dpms:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_content_protect=
ion@atomic-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15026_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445=
">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-2560x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15026/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7621">Intel XE#7621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_bw@connected-linear-tiling-=
4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_chamelium_frames@dp-crc-sin=
gle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_content_protection@atomic-d=
pms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_content_protection@suspend-r=
esume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) =
+3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-64x64.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026=
/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2=
320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x=
21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
26">Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1502=
6/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
49">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-l=
inear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-arg=
b161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_joiner@basic-big-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-lnl-4/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7340">Intel XE#7340</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@kms_psr@psr-sprite-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_rotation_crc@primary-y-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@kms_setmode@basic-clone-single-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15026/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_eudebug@vma-ufence.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">=
Intel XE#7636</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_evict@evict-small-multi-queu=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-qu=
eue-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +18 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-4k-range-device-host:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-1/igt@xe_exec_system_allocator@eu-fault-4k-range-devic=
e-host.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15026/shard-bmg-5/igt@xe_exec_system_allocator@eu-fault-4k-rang=
e-device-host.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7592">Intel XE#7592</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-multi-vma.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-lnl-1/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-exec=
queues-mmap-remap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_exec_system_allocator@proce=
ss-many-large-execqueues-mmap-remap.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) +3 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_fault_injection@exec-queue-cr=
eate-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
865/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8865/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15026/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15026/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/=
shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15026/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15026/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15026/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-10/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15026/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_module_load@load.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457=
">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7405">Intel XE#7405</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefault-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/759=
0">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-6/igt@xe_prime_self_import@reimport-vs=
-gem_close-race.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_pxp@pxp-termination-key-updat=
e-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15026/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-5/ig=
t@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#=
7308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15026/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/sha=
rd-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-6/igt@xe_prime_self_import@export-vs-gem_close-race.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7725">Intel XE#7725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15026/shard-bmg-8/igt@xe_prime_self_import@export-vs=
-gem_close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel X=
E#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15026/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2594">Intel XE#2594</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15026/shard-bmg-9=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8865 -&gt; IGTPW_15026</li>
<li>Linux: xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469 -&gt; xe-4923-3=
3d3b65ec51f2bddafa26a80249e26c78435f169</li>
</ul>
<p>IGTPW_15026: f44bd271497d7be3c64eb606a8aa749110700776 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 898b5aa235c5b269d6c745f=
d84270b296aa75469<br />
  xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a8=
0249e26c78435f169</p>

</body>
</html>

--===============5347509919211471210==--
