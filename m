Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ACBC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 15:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339E210E1DD;
	Tue, 30 Jul 2024 15:53:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D72F10E056;
 Tue, 30 Jul 2024 15:53:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4905707966601043889=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe=5Fgt=5Ffreq=3A?=
 =?utf-8?q?_Add_a_wait_after_gt_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 15:53:30 -0000
Message-ID: <172235481049.429178.6444973455856357869@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730115058.1104767-1-karthik.poosa@intel.com>
In-Reply-To: <20240730115058.1104767-1-karthik.poosa@intel.com>
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

--===============4905707966601043889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_gt_freq: Add a wait after gt reset
URL   : https://patchwork.freedesktop.org/series/136675/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7942_full -> XEIGTPW_11494_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11494_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11494_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11494_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-lnl:          NOTRUN -> [SKIP][1] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][5] -> [SKIP][6] +24 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
    - shard-dg2-set2:     [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [ABORT][11] ([Intel XE#2421]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@core_hotunplug@hotrebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@core_hotunplug@hotrebind.html
    - shard-lnl:          [ABORT][13] ([Intel XE#2421]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@core_hotunplug@hotrebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@core_hotunplug@hotrebind.html

  * igt@kms_3d:
    - shard-lnl:          [SKIP][15] ([Intel XE#1465]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_3d.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_3d.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][21] ([Intel XE#367]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][23] ([Intel XE#306]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-lnl:          [SKIP][25] ([Intel XE#373]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          [SKIP][27] ([Intel XE#1424]) -> [SKIP][28] +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          [SKIP][29] ([Intel XE#1413]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          [SKIP][31] ([Intel XE#309]) -> [SKIP][32] +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][33] ([Intel XE#323]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][35] ([Intel XE#703]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          [SKIP][37] ([Intel XE#1421]) -> [SKIP][38] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-lnl:          [TIMEOUT][39] ([Intel XE#1504]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][41] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][42] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          [SKIP][43] ([Intel XE#352]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][46] +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][47] ([Intel XE#653]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][49] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][50] +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          [SKIP][51] ([Intel XE#2340]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_getfb@getfb2-accept-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          [SKIP][53] ([Intel XE#599]) -> [SKIP][54] +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-lnl:          [SKIP][55] ([Intel XE#2366]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          [SKIP][57] ([Intel XE#2318]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#1201]) -> [SKIP][64] +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#929]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr-primary-render.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][68] +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          [SKIP][69] ([Intel XE#756]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          [SKIP][71] ([Intel XE#1091]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p}:
    - shard-lnl:          [SKIP][73] ([Intel XE#2191]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11494_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#2134])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@fbdev@read.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@fbdev@read.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#1201] / [i915#2575]) +31 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#1426]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1407]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#1201]) +14 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [PASS][85] -> [SKIP][86] ([Intel XE#2351]) +37 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1124]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201]) +9 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#610])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#367])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#367])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#787]) +6 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1399]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#787]) +111 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [i915#2575]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#373]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#373]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([i915#2575]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_color@ctm-0-75.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1413]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1424])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#323])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#309])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-lnl:          [PASS][110] -> [SKIP][111] ([Intel XE#2423]) +16 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2351])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#776])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1421]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][115] ([Intel XE#2019]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([i915#2575]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#1901]) +2 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][119] ([Intel XE#1551]) +1 other test dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1397] / [Intel XE#1745])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1397]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1401]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#651]) +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#651]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#656]) +19 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2351]) +8 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#653]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#417])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1470])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#1162])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][137] -> [DMESG-FAIL][138] ([Intel XE#324])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#599]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#498]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [PASS][141] -> [SKIP][142] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2318]) +10 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1439])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1122] / [Intel XE#1201])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1128])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#929]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1406]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][154] ([Intel XE#1649])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_psr@psr2-sprite-render@edp-1.html

  * igt@kms_rmfb@close-fd@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][155] ([Intel XE#294])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_rmfb@close-fd@pipe-a-edp-1.html

  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][156] ([Intel XE#294]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#2423]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#756])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#756])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1123])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1126] / [Intel XE#1201])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][163] ([Intel XE#1473] / [Intel XE#392])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#688]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][165] ([Intel XE#1600])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][166] -> [INCOMPLETE][167] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-threads-large.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1130]) +6 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          [PASS][169] -> [SKIP][170] ([Intel XE#1130]) +79 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@many-execqueues-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1130]) +18 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_exec_basic@many-execqueues-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1392]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#288]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#1130] / [Intel XE#1201]) +18 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#1201] / [Intel XE#255])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][177] -> [SKIP][178] ([Intel XE#1192] / [Intel XE#1201])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1201] / [Intel XE#378])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@xe_module_load@force-load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1201] / [Intel XE#1337])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#1201] / [Intel XE#979])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#979])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][183] ([Intel XE#1173])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][184] ([Intel XE#1551] / [Intel XE#569])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#584])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][186] -> [ABORT][187] ([Intel XE#1358] / [Intel XE#1607])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [PASS][188] -> [DMESG-WARN][189] ([Intel XE#2019]) +2 other tests dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#944])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#944]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][193] -> [SKIP][194] ([Intel XE#1130] / [Intel XE#1201]) +52 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][195] -> [SKIP][196] ([Intel XE#1130]) +24 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
    - shard-lnl:          [SKIP][199] ([Intel XE#1885]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@pan:
    - shard-lnl:          [SKIP][201] -> [PASS][202] +2 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@fbdev@pan.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@fbdev@pan.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [DMESG-WARN][203] -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [i915#2575]) -> [PASS][206] +53 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-lnl:          [SKIP][207] ([Intel XE#2423]) -> [PASS][208] +45 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][209] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [SKIP][211] ([Intel XE#2366]) -> [PASS][212] +2 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201]) -> [PASS][214] +28 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][215] ([Intel XE#2351]) -> [PASS][216] +30 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][217] ([Intel XE#324]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane@plane-position-hole.html

  * {igt@kms_plane@plane-position-hole@pipe-b-plane-4}:
    - shard-lnl:          [DMESG-WARN][219] ([Intel XE#324]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][221] -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][223] ([Intel XE#771] / [Intel XE#899]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#899]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-lnl:          [FAIL][227] ([Intel XE#2180]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][229] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][232] +77 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][233] ([Intel XE#2105]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - shard-lnl:          [SKIP][235] ([Intel XE#1130]) -> [PASS][236] +84 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_threads@threads-userptr-rebind-err.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@xe_exec_threads@threads-userptr-rebind-err.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [INCOMPLETE][237] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][239] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][241] ([Intel XE#2019]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_pm@s4-exec-after.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][243] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][245] ([Intel XE#2019] / [Intel XE#2280]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#623]) -> [SKIP][248] ([Intel XE#1201] / [i915#2575])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          [SKIP][249] ([Intel XE#1466]) -> [SKIP][250] ([Intel XE#2423])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#316]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][254] ([Intel XE#316])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          [SKIP][255] ([Intel XE#1407]) -> [SKIP][256] ([Intel XE#2351]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-lnl:          [SKIP][259] ([Intel XE#2351]) -> [SKIP][260] ([Intel XE#1407]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201]) -> [SKIP][262] ([Intel XE#619])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          [SKIP][263] ([Intel XE#2351]) -> [SKIP][264] ([Intel XE#1467])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][266] ([Intel XE#610])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1124]) -> [SKIP][268] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][269] ([Intel XE#1124]) -> [SKIP][270] ([Intel XE#2351]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          [SKIP][271] ([Intel XE#2351]) -> [SKIP][272] ([Intel XE#1124]) +6 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][274] ([Intel XE#1124]) +8 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1124])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][277] ([Intel XE#2351]) -> [SKIP][278] ([Intel XE#1428])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][280] ([Intel XE#2351])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][282] ([Intel XE#1201]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#346])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
    - shard-lnl:          [SKIP][287] ([Intel XE#2351]) -> [SKIP][288] ([Intel XE#346])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_joiner@invalid-modeset.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#367]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#367])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#367]) -> [SKIP][292] ([Intel XE#1201] / [i915#2575])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201] / [i915#2575]) -> [SKIP][294] ([Intel XE#367])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          [SKIP][295] ([Intel XE#2423]) -> [SKIP][296] ([Intel XE#367])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][298] ([Intel XE#367])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][300] ([i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          [SKIP][301] ([Intel XE#367]) -> [SKIP][302] ([Intel XE#2423])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][304] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          [SKIP][305] ([Intel XE#1512]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#787]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][309] ([Intel XE#2351]) -> [SKIP][310] ([Intel XE#1399]) +10 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][311] ([Intel XE#1399]) -> [SKIP][312] ([Intel XE#2351]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][314] ([Intel XE#1252]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][318] ([Intel XE#1201])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][320] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][322] ([Intel XE#787]) +27 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][324] ([Intel XE#1201]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201]) -> [SKIP][326] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#2351])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1252]) -> [SKIP][330] ([Intel XE#1201])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#314])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          [SKIP][333] ([Intel XE#2351]) -> [SKIP][334] ([Intel XE#314])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#306]) -> [SKIP][336] ([Intel XE#1201] / [i915#2575])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][338] ([Intel XE#306])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          [SKIP][339] ([Intel XE#2423]) -> [SKIP][340] ([Intel XE#373]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [i915#2575]) -> [SKIP][342] ([Intel XE#373])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#373]) -> [SKIP][344] ([Intel XE#1201] / [i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [i915#2575]) -> [SKIP][346] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][350] ([Intel XE#373]) +6 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][352] ([Intel XE#1201] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
    - shard-lnl:          [SKIP][353] ([Intel XE#373]) -> [SKIP][354] ([Intel XE#2423]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#373]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@degamma:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1201] / [i915#2575]) -> [SKIP][358] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_color@degamma.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201] / [i915#2575]) -> [SKIP][360] ([Intel XE#308])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-lnl:          [SKIP][361] ([Intel XE#2423]) -> [SKIP][362] ([Intel XE#1413])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          [SKIP][363] ([Intel XE#1424]) -> [SKIP][364] ([Intel XE#2423])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [i915#2575]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#455])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][368] ([Intel XE#308])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][369] ([Intel XE#2423]) -> [SKIP][370] ([Intel XE#1424]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][372] ([Intel XE#1201] / [i915#2575])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#308]) -> [SKIP][374] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][375] ([Intel XE#309]) -> [SKIP][376] ([Intel XE#2423])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          [SKIP][377] ([Intel XE#2423]) -> [SKIP][378] ([Intel XE#323])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          [SKIP][379] ([Intel XE#2423]) -> [SKIP][380] ([Intel XE#309]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][382] ([i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][384] ([Intel XE#1201] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-lnl:          [SKIP][385] ([Intel XE#323]) -> [SKIP][386] ([Intel XE#2423])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1201]) -> [SKIP][388] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-lnl:          [SKIP][389] ([Intel XE#2351]) -> [SKIP][390] ([Intel XE#599])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#701]) -> [SKIP][392] ([Intel XE#1201] / [Intel XE#701])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][394] ([Intel XE#1201] / [i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1201] / [i915#2575]) -> [SKIP][396] ([Intel XE#1138] / [Intel XE#1201])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          [SKIP][397] ([Intel XE#2423]) -> [SKIP][398] ([Intel XE#1138])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_feature_discovery@display-4x.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201] / [i915#2575]) -> [SKIP][400] ([Intel XE#1135])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          [SKIP][401] ([Intel XE#2423]) -> [SKIP][402] ([Intel XE#1421]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][403] ([Intel XE#2019]) -> [SKIP][404] ([i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][405] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][406] ([Intel XE#1551])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          [SKIP][407] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][408] ([Intel XE#2351]) +4 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][410] ([Intel XE#1201]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][411] ([Intel XE#2351]) -> [SKIP][412] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][413] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][414] ([Intel XE#2351])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          [SKIP][415] ([Intel XE#2351]) -> [SKIP][416] ([Intel XE#1401] / [Intel XE#1745])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#455]) -> [SKIP][418] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#651]) -> [SKIP][420] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][421] ([Intel XE#2351]) -> [SKIP][422] ([Intel XE#651]) +8 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][424] ([Intel XE#651]) +19 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          [SKIP][425] ([Intel XE#656]) -> [SKIP][426] ([Intel XE#2351]) +19 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          [SKIP][427] ([Intel XE#2351]) -> [SKIP][428] ([Intel XE#656]) +19 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          [SKIP][429] ([Intel XE#651]) -> [SKIP][430] ([Intel XE#2351]) +7 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201]) -> [SKIP][434] ([Intel XE#651]) +3 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][438] ([Intel XE#1201]) +4 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#651]) -> [SKIP][440] ([Intel XE#1201]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][442] ([Intel XE#1201]) +4 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][444] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#653]) -> [SKIP][446] ([Intel XE#1201])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201]) -> [SKIP][448] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201]) -> [SKIP][450] ([Intel XE#653]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][452] ([Intel XE#653]) +14 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#658]) -> [SKIP][454] ([Intel XE#1201] / [Intel XE#658])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#653]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1201]) -> [SKIP][458] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-lnl:          [SKIP][459] ([Intel XE#2423]) -> [SKIP][460] ([Intel XE#605])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1201] / [i915#2575]) -> [SKIP][462] ([Intel XE#1201] / [Intel XE#605])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          [SKIP][463] ([Intel XE#1470]) -> [SKIP][464] ([Intel XE#2423])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-lnl:          [FAIL][465] ([Intel XE#2028]) -> [SKIP][466] ([Intel XE#2423])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1201] / [i915#2575]) -> [SKIP][468] ([Intel XE#455]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_panel_fitting@legacy.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][470] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html
    - shard-lnl:          [SKIP][471] ([Intel XE#599]) -> [SKIP][472] ([Intel XE#2423])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][474] ([i915#2575]) +2 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][475] ([Intel XE#2423]) -> [SKIP][476] ([Intel XE#599])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][477] ([Intel XE#361]) -> [SKIP][478] ([Intel XE#1201] / [Intel XE#455])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][480] ([Intel XE#1201] / [i915#2575])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          [SKIP][481] ([Intel XE#498]) -> [SKIP][482] ([Intel XE#2423]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          [SKIP][483] ([Intel XE#2423]) -> [SKIP][484] ([Intel XE#2318])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-lnl:          [SKIP][485] ([Intel XE#2318]) -> [SKIP][486] ([Intel XE#2423])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][488] ([Intel XE#1201] / [i915#2575])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][490] ([Intel XE#870])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#870]) -> [SKIP][492] ([Intel XE#1201] / [Intel XE#870])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][493] ([Intel XE#2351]) -> [SKIP][494] ([Intel XE#1131])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1201]) -> [SKIP][496] ([Intel XE#1129] / [Intel XE#1201])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1201]) -> [SKIP][498] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1489]) -> [SKIP][500] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201]) -> [SKIP][502] ([Intel XE#1489])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][504] ([Intel XE#1201])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][506] ([Intel XE#1489])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][508] ([Intel XE#1122])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1201]) -> [SKIP][510] ([Intel XE#929]) +2 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
    - shard-lnl:          [SKIP][511] ([Intel XE#2351]) -> [SKIP][512] ([Intel XE#1406]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#929]) -> [SKIP][514] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][516] ([Intel XE#1201] / [Intel XE#2351])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          [SKIP][517] ([Intel XE#1406]) -> [SKIP][518] ([Intel XE#2351])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#929]) -> [SKIP][520] ([Intel XE#1201] / [Intel XE#2231])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][522] ([Intel XE#929]) +5 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1201]) -> [SKIP][524] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@psr2-cursor-render.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][526] ([Intel XE#1201]) +4 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_psr@psr2-dpms.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [SKIP][527] ([Intel XE#2351]) -> [FAIL][528] ([Intel XE#1649])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1201]) -> [SKIP][530] ([Intel XE#1149] / [Intel XE#1201])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rmfb@close-fd:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1201] / [i915#2575]) -> [FAIL][532] ([Intel XE#294])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rmfb@close-fd.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rmfb@close-fd.html
    - shard-lnl:          [SKIP][533] ([Intel XE#2423]) -> [FAIL][534] ([Intel XE#294])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_rmfb@close-fd.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_rmfb@close-fd.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][536] ([Intel XE#327])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1201] / [i915#2575]) -> [SKIP][538] ([Intel XE#1201] / [Intel XE#327])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          [SKIP][539] ([Intel XE#2423]) -> [SKIP][540] ([Intel XE#1437])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1201] / [i915#2575]) -> [SKIP][542] ([Intel XE#1127] / [Intel XE#1201])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#327]) -> [SKIP][544] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][545] ([Intel XE#2423]) -> [SKIP][546] ([Intel XE#1127]) +1 other test skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#1201] / [i915#2575]) -> [SKIP][548] ([Intel XE#1127])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#455]) -> [SKIP][550] ([Intel XE#1201] / [i915#2575])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          [SKIP][551] ([Intel XE#2423]) -> [SKIP][552] ([Intel XE#1435])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][554] ([Intel XE#455]) +11 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_vrr@flipline.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          [SKIP][555] ([Intel XE#2423]) -> [SKIP][556] ([Intel XE#756])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#756]) -> [SKIP][558] ([Intel XE#1201] / [Intel XE#756])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][560] ([Intel XE#1201] / [i915#2575])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][562] ([i915#2575])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][564] ([Intel XE#1050])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          [SKIP][565] ([Intel XE#1130]) -> [SKIP][566] ([Intel XE#1447])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][568] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][570] ([Intel XE#1123])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][572] ([Intel XE#1130])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          [SKIP][573] ([Intel XE#688]) -> [SKIP][574] ([Intel XE#1130]) +9 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][575] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [FAIL][576] ([Intel XE#1000])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          [SKIP][577] ([Intel XE#1130]) -> [SKIP][578] ([Intel XE#688]) +5 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-vm.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-lnl:          [SKIP][579] ([Intel XE#1130]) -> [SKIP][580] ([Intel XE#1392]) +4 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          [SKIP][581] ([Intel XE#1392]) -> [SKIP][582] ([Intel XE#1130]) +4 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_compute_mode@many-basic:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][584] ([Intel XE#1130]) +2 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_compute_mode@many-basic.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_compute_mode@many-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#288]) -> [SKIP][586] ([Intel XE#1130])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][588] ([Intel XE#1130]) +2 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][590] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#288]) -> [SKIP][592] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][594] ([Intel XE#288]) +3 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][596] ([Intel XE#288]) +12 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][598] ([Intel XE#1130] / [Intel XE#1201]) +4 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-dg2-set2:     [FAIL][599] ([Intel XE#2262]) -> [SKIP][600] ([Intel XE#1130] / [Intel XE#1201])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][602] ([Intel XE#1130])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_media_fill@media-fill.html
    - shard-lnl:          [SKIP][603] ([Intel XE#560]) -> [SKIP][604] ([Intel XE#1130])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_media_fill@media-fill.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][606] ([Intel XE#512])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_mmap@small-bar.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [DMESG-FAIL][607] -> [FAIL][608] ([Intel XE#2136])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@many-reload.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-FAIL][609] ([Intel XE#2019]) -> [FAIL][610] ([Intel XE#2136])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_module_load@reload.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][611] ([Intel XE#1204]) -> [FAIL][612] ([Intel XE#1204] / [Intel XE#2136])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][614] ([Intel XE#1130])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][615] ([Intel XE#1173]) -> [SKIP][616] ([Intel XE#1061] / [Intel XE#1201])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_peer2peer@read.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][618] ([Intel XE#1173])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_peer2peer@write.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][620] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
    - shard-lnl:          [SKIP][621] ([Intel XE#1130]) -> [SKIP][622] ([Intel XE#2284] / [Intel XE#366])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][624] ([Intel XE#2284] / [Intel XE#366])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          [SKIP][625] ([Intel XE#584]) -> [SKIP][626] ([Intel XE#1130]) +1 other test skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_pm@s3-exec-after.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][628] ([Intel XE#579])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [SKIP][629] ([Intel XE#1130]) -> [FAIL][630] ([Intel XE#958])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][632] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_query@multigpu-query-config.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][634] ([Intel XE#1130] / [Intel XE#1201])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
    - shard-lnl:          [SKIP][635] ([Intel XE#944]) -> [SKIP][636] ([Intel XE#1130])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          [SKIP][637] ([Intel XE#1130]) -> [SKIP][638] ([Intel XE#944]) +1 other test skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#944]) -> [SKIP][640] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][642] ([Intel XE#944]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2180]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2180
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7942 -> IGTPW_11494
  * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33

  IGTPW_11494: 11494
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
  xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33: 277a79bf0ef669d9b96f6787906f4e5edb827a33

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/index.html

--===============4905707966601043889==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_gt_freq: Add a wait after gt reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136675/">https://patchwork.freedesktop.org/series/136675/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7942_full -&gt; XEIGTPW_11494_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11494_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11494_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11494_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_vrr@flip-basic.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@core_hotunplug@hotrebind.html">SKIP</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@core_hotunplug@hotrebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_feature_discovery@display-3x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366">Intel XE#2366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p}:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11494_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_flip@dpms-off-confusion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_psr@psr2-sprite-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_rmfb@close-fd@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_exec_basic@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@fbdev@pan.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@fbdev@pan.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_flip@flip-vs-rmfb.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366">Intel XE#2366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-b-plane-4}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2180">Intel XE#2180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_threads@threads-userptr-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@xe_exec_threads@threads-userptr-rebind-err.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rmfb@close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rmfb@close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_rmfb@close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@kms_rmfb@close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_compute_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_compute_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_gt_freq@freq_fixed_exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@many-reload.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-463/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-5/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11494/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7942 -&gt; IGTPW_11494</li>
<li>Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -&gt; xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33</li>
</ul>
<p>IGTPW_11494: 11494<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d<br />
  xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33: 277a79bf0ef669d9b96f6787906f4e5edb827a33</p>

</body>
</html>

--===============4905707966601043889==--
