Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C25109448F
	for <igt-dev@archiver.kernel.org>; Sat, 21 Mar 2026 19:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE0110E30F;
	Sat, 21 Mar 2026 19:46:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF44810E30F;
 Sat, 21 Mar 2026 19:46:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0570633883420232055=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_lib/drmtest=3A_Create_prop?=
 =?utf-8?q?er_error_report_when_open_driver_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 21 Mar 2026 19:46:44 -0000
Message-ID: <177412240495.383329.390362022866951611@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320123417.30143-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260320123417.30143-1-kamil.konieczny@linux.intel.com>
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

--===============0570633883420232055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/drmtest: Create proper error report when open driver fails
URL   : https://patchwork.freedesktop.org/series/163593/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8815_FULL -> XEIGTPW_14826_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14826_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14826_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14826_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-8/igt@kms_psr@psr2-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@kms_psr@psr2-suspend.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@xe_noexec_ping_pong@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@xe_noexec_ping_pong@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14826_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3157])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7621])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367] / [Intel XE#7354])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#306] / [Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6507])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#307] / [Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#5354])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2291] / [Intel XE#7343])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#7571])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2373] / [Intel XE#7344])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1421])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#301]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][41] -> [INCOMPLETE][42] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7179])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7178] / [Intel XE#7349])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#352])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2311]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#6312] / [Intel XE#651])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4141]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7061] / [Intel XE#7356])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2313]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#656]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7061] / [Intel XE#7356])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#1503]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#7086])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7130]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7283])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7376] / [Intel XE#870])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#7340] / [Intel XE#7504])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1489]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1406])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2414])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#1435])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][69] -> [INCOMPLETE][70] ([Intel XE#6321])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7140])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7482]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1392])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2322] / [Intel XE#7372])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7136])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7136]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6874]) +12 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#6874]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7138]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7138])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106]) -> ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [SKIP][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132]) ([Intel XE#2457] / [Intel XE#7405])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-4/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-8/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-9/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-7/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2284] / [Intel XE#7370])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@xe_pm@d3cold-basic.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [PASS][134] -> [FAIL][135] ([Intel XE#5937]) +1 other test fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][136] -> [FAIL][137] ([Intel XE#6569])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][139] ([Intel XE#2291]) -> [PASS][140] +2 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][141] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][143] ([Intel XE#4302]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][145] ([Intel XE#3321]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][147] ([Intel XE#2316]) -> [PASS][148] +7 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [INCOMPLETE][149] -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][151] ([Intel XE#1503]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_hdr@static-swap.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][153] ([Intel XE#7086]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][155] ([Intel XE#4596]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][157] ([Intel XE#2571] / [Intel XE#7343]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][159] ([Intel XE#1435]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][161] ([Intel XE#2142]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][163] ([Intel XE#5625]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][165] -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-2/igt@xe_pmu@gt-frequency.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][167] ([Intel XE#6569]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@basic-wedged-read:
    - shard-bmg:          [ABORT][169] ([Intel XE#7578]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@xe_wedged@basic-wedged-read.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@xe_wedged@basic-wedged-read.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][171] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) -> [SKIP][172] ([Intel XE#7621])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [FAIL][173] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][174] ([Intel XE#7194])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][175] ([Intel XE#2341]) -> [FAIL][176] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][177] ([Intel XE#2312]) -> [SKIP][178] ([Intel XE#2311]) +13 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][179] ([Intel XE#2312]) -> [SKIP][180] ([Intel XE#4141]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][181] ([Intel XE#4141]) -> [SKIP][182] ([Intel XE#2312]) +6 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2311]) -> [SKIP][184] ([Intel XE#2312]) +16 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][185] ([Intel XE#2313]) -> [SKIP][186] ([Intel XE#2312]) +14 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][187] ([Intel XE#2312]) -> [SKIP][188] ([Intel XE#2313]) +16 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][189] ([Intel XE#3544]) -> [SKIP][190] ([Intel XE#3374] / [Intel XE#3544])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][191] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][192] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][193] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][194] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][195] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][196] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@xe_peer2peer@write.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_peer2peer@write.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * IGT: IGT_8815 -> IGTPW_14826
  * Linux: xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8 -> xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4

  IGTPW_14826: 14826
  IGT_8815: 8815
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8
  xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4: f202c0d0dece0eeefb750a6a9d80f4b7442529f4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/index.html

--===============0570633883420232055==
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
<tr><td><b>Series:</b></td><td>lib/drmtest: Create proper error report when=
 open driver fails</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163593/">https://patchwork.freedesktop.org/series/163593/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14826/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14826/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8815_FULL -&gt; XEIGTPW_14826_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14826_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14826_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
826_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-8/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@=
kms_psr@psr2-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userp=
tr.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-10/igt@xe_noexec_ping_pong@basic.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-=
1/igt@xe_noexec_ping_pong@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14826_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7621">Intel XE#7621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_bw@connected-linear-tiling-=
4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_chamelium_sharpness_filter@f=
ilter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-fli=
p-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4826/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#734=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_148=
26/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel =
XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shar=
d-bmg-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel =
XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_148=
26/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14826/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-7/=
igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-=
yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#73=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_force_connector_basic@force-=
connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-sh=
rfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-=
abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-arg=
b161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-b=
mg-3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/sha=
rd-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">=
Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-7/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@kms_psr@pr-primary-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826=
/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14826/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_evict@evict-small-multi-queue=
-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-si=
mple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@xe_exec_balancer@many-execqueues=
-parallel-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefet=
ch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-qu=
eue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6874">Intel XE#6874</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@xe_exec_threads@threads-multi-qu=
eue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8815/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8815/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8815/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8815/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8815/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8815/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8815/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
8815/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8815/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8815/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-3/igt@xe_modul=
e_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14826/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826=
/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14826/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14826/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14826/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4826/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14826/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14826/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1482=
6/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14826/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14826/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14826/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457"=
>Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@xe_pm@d3cold-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovisio=
n-increase-numvfs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14826/shard-bmg-9/igt@xe_sriov_auto_provisioning@sel=
fconfig-reprovision-increase-numvfs.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) +1 other t=
est fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/ig=
t@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-re=
size-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14826/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legac=
y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14826/shard-bmg-9/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">In=
tel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14826/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14826/shard-bmg-10/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html">INCOM=
PLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14826/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_hdr@static-swap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/sha=
rd-bmg-8/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7086">Intel XE#7086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14826/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_plane_scaling@2x-scaler-=
multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14826/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-multi-vma.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-3/igt@xe_exec_system_all=
ocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-lnl-2/igt@xe_pmu@gt-frequency.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-5/igt@x=
e_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE=
#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14826/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-1/igt@xe_wedged@basic-wedged-read.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#=
7578</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14826/shard-bmg-2/igt@xe_wedged@basic-wedged-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@k=
ms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621">Intel XE#7621=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_content_prote=
ction@legacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7194">Intel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14826/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-10/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shr=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-5/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shr=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#=
3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14826/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544"=
>Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@kms_rotation_crc@bad=
-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">I=
ntel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@kms_rotation_crc@sprite-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8815/shard-bmg-3/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel=
 XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-8/igt@xe_peer2peer@write.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</=
li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8815 -&gt; IGTPW_14826</li>
<li>Linux: xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8 -&gt; xe-4754-f=
202c0d0dece0eeefb750a6a9d80f4b7442529f4</li>
</ul>
<p>IGTPW_14826: 14826<br />
  IGT_8815: 8815<br />
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb=
64af0353971f16bd8<br />
  xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4: f202c0d0dece0eeefb750a6=
a9d80f4b7442529f4</p>

</body>
</html>

--===============0570633883420232055==--
