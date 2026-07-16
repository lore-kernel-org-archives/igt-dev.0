Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BB6C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 15:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0FA10E375;
	Thu, 16 Jul 2026 15:56:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908E10E0F7;
 Thu, 16 Jul 2026 15:56:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7567370814637539795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel/xe=5Fmempage?=
 =?utf-8?q?=5Foffline=3A_Add_fault-inject_based_page_offline_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jul 2026 15:56:26 -0000
Message-ID: <178421738635.198473.2832643675915877677@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716095703.1543088-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260716095703.1543088-2-tejas.upadhyay@intel.com>
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

--===============7567370814637539795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_mempage_offline: Add fault-inject based page offline tests
URL   : https://patchwork.freedesktop.org/series/170555/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9008_FULL -> XEIGTPW_15540_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15540_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15540_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15540_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * {igt@xe_mempage_offline@inject-duplicate-page} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@xe_mempage_offline@inject-duplicate-page.html

  * {igt@xe_mempage_offline@inject-single-page} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@xe_mempage_offline@inject-single-page.html

  
New tests
---------

  New tests have been introduced between XEIGT_9008_FULL and XEIGTPW_15540_FULL:

### New IGT tests (2) ###

  * igt@xe_mempage_offline@inject-duplicate-page:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_mempage_offline@inject-single-page:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15540_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7059] / [Intel XE#7085])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7059] / [Intel XE#7085])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2724] / [Intel XE#7449])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2325] / [Intel XE#7358])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7642])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4210] / [Intel XE#7467])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#8265])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#8265]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6126] / [Intel XE#776])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301]) +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7351])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7179])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#656] / [Intel XE#7905])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +16 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7905])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2313]) +18 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7865])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#1503])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7283]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7283])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#5021] / [Intel XE#7377])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2685] / [Intel XE#3307])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#3309] / [Intel XE#7368])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2499])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1489]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2893] / [Intel XE#7304])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2330] / [Intel XE#5813])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#3904] / [Intel XE#7342])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-7/igt@kms_vrr@flip-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1499])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8370])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8374]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8364]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#8364]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8369])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - shard-lnl:          [PASS][63] -> [ABORT][64] ([Intel XE#8007])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-3/igt@xe_exec_system_allocator@once-new-busy-nomemset.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@xe_exec_system_allocator@once-new-busy-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8378]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#8378]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [PASS][67] -> [ABORT][68] ([Intel XE#8007]) +2 other tests abort
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6964])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6964])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7793]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4733] / [Intel XE#7417])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#944])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][74] ([Intel XE#3098]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][76] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][78] ([Intel XE#7308]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][80] ([Intel XE#8399]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][82] -> [PASS][83] +2 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][84] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [ABORT][86] ([Intel XE#8007]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap:
    - shard-bmg:          [ABORT][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [ABORT][90] ([Intel XE#8007]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [SKIP][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-10/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-7/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-9/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-8/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-5/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-1/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-6/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-10/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-10/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-6/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-8/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-3/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-3/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-5/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-6/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          [FAIL][142] ([Intel XE#7992]) -> [PASS][143] +4 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-10/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0:
    - shard-bmg:          [SKIP][144] -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][146] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][147] ([Intel XE#309] / [Intel XE#7343])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][148] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][149] ([Intel XE#301])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9008 -> IGTPW_15540

  IGTPW_15540: 15540
  IGT_9008: 9008
  xe-5417-fcaba3bc017906059b910ece3f83185e93010581: fcaba3bc017906059b910ece3f83185e93010581

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/index.html

--===============7567370814637539795==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_mempage_offline: Add fault-in=
ject based page offline tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170555/">https://patchwork.freedesktop.org/series/170555/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15540/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15540/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9008_FULL -&gt; XEIGTPW_15540_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15540_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15540_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
540_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15540/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">IN=
COMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_mempage_offline@inject-duplicate-page} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@xe_mempage_offline@inject-dupli=
cate-page.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_mempage_offline@inject-single-page} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@xe_mempage_offline@inject-single=
-page.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9008_FULL and XEIGTPW_15540=
_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15540_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15540/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic=
@pipe-b-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_async_flips@alternate-sync-asyn=
c-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-g=
en12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_cdclk@mode-transition-all-o=
utputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-=
with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
26">Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1554=
0/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_flip_scaled_crc@flip-p016-li=
near-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-c=
cs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_plane_scaling@intel-max-src=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2685">Intel XE#2685</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">=
Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@kms_psr@fbc-pr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-7/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-4/igt@k=
ms_vrr@flip-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@xe_compute_preempt@compute-preem=
pt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5191">Intel XE#5191</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-1/igt@xe_evict@evict-small-external-mu=
lti-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-p=
reempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-5/igt@xe_exec_multi_queue@one-queue-pr=
eempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-er=
ror-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-3/igt@xe_exec_system_allocator@once-new-busy-nomemset.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15540/shard-lnl-6/igt@xe_exec_system_allocator@once-new-busy-nomemset.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@xe_exec_threads@threads-multi-qu=
eue-cm-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalida=
te:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-4/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-=
xe_tile_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_tile_init_early.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other=
 tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-f=
ail-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-lnl-6/igt@xe_multigpu_svm@mgpu-latency-cop=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-4/igt@xe_page_reclaim@boundary-split.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15540/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098"=
>Intel XE#3098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15540/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE=
#7308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15540/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard=
-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-=
lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_evict@evict-mixed-m=
any-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15540/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-i=
nvalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mma=
p-remap-dontunmap.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-many-stride-mmap-remap-dontunmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_pcode_probe_early.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_fault_inje=
ction@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9008/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9008/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9008/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9008/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9008/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/sh=
ard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_900=
8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
9008/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-6/igt@xe_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_9008/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9008/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9008/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405"=
>Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15540/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15540/shard-bmg-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1554=
0/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-9/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15540/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15540/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15540/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5540/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15540/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1554=
0/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15540/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-10/igt@xe_sriov_auto_provisioning@exclusive-ranges@num=
vfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-8/igt@xe_sriov_auto_provision=
ing@exclusive-ranges@numvfs-random.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt=
1-vcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-bmg-4/igt@xe_sriov_scheduling@default-enabled-fair-schedul=
ing@numvfs-random-gt1-vcs0.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15540/shard-bmg-7/igt@xe_sriov_scheduling@d=
efault-enabled-fair-scheduling@numvfs-random-gt1-vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15540/shard-lnl-1/igt@k=
ms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">=
Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9008/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15540/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
1">Intel XE#301</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9008 -&gt; IGTPW_15540</li>
</ul>
<p>IGTPW_15540: 15540<br />
  IGT_9008: 9008<br />
  xe-5417-fcaba3bc017906059b910ece3f83185e93010581: fcaba3bc017906059b910ec=
e3f83185e93010581</p>

</body>
</html>

--===============7567370814637539795==--
