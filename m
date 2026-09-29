Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD35CA5FAE
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95C510E9A2;
	Tue, 29 Sep 2026 06:36:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6F710E9A2;
 Tue, 29 Sep 2026 06:35:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8479973611692670741=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Fsurvivabi?=
 =?utf-8?q?lity=3A_update_ignored_dmesg_regex_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 29 Sep 2026 06:35:22 -0000
Message-ID: <179066372283.217310.9724870598330645307@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929032354.1971070-4-sk.anirban@intel.com>
In-Reply-To: <20260929032354.1971070-4-sk.anirban@intel.com>
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

--===============8479973611692670741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: update ignored dmesg regex (rev8)
URL   : https://patchwork.freedesktop.org/series/170062/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9114_FULL -> XEIGTPW_15914_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15914_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#7225])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5901]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5808]) +12 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5850]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5851])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2328] / [Intel XE#7367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#7679])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5822]) +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +10 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#3432]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#9205]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2724] / [Intel XE#7449])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#5824]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7358]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7358]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6507] / [Intel XE#7358])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#6507])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#6969]) +15 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6969]) +15 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#9333]) +14 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4:
    - shard-ptl:          NOTRUN -> [FAIL][36] ([Intel XE#9333]) +41 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-3:
    - shard-lnl:          NOTRUN -> [FAIL][37] ([Intel XE#9333]) +15 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-3.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_content_protection@atomic.html
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#7642])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#307] / [Intel XE#6974])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2390] / [Intel XE#6974])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5832] / [Intel XE#6974])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2321] / [Intel XE#7355])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5900])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5962]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309] / [Intel XE#7343])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5962] / [Intel XE#7343]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1508])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4210] / [Intel XE#7467])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5870])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8265]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5907]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#8265])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4156] / [Intel XE#7425])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1138] / [Intel XE#7344])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#9287])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#2316]) +13 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3321]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7178] / [Intel XE#7349])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#7178]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7178] / [Intel XE#7351])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7179])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7179])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7178] / [Intel XE#7349])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7178] / [Intel XE#7351])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#352])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5800] / [Intel XE#6312]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#6312]) +14 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6312]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4141]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5812]) +61 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7905]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2311]) +35 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7865]) +17 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#7061])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7061]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#7061]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7865]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2313]) +43 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#9312])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [PASS][91] -> [FAIL][92] ([Intel XE#9313])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-6/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-ptl:          NOTRUN -> [ABORT][93] ([Intel XE#9362]) +2 other tests abort
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#3544])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6911] / [Intel XE#7378])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#6900])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [PASS][97] -> [ABORT][98] ([Intel XE#9093]) +1 other test abort
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-9/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7283]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#8303]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#7283])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-ptl:          [PASS][102] -> [ABORT][103] ([Intel XE#9362]) +5 other tests abort
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#5020])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#6886]) +14 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2499])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#5849]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#7304]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#5858]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4608])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4608] / [Intel XE#7304])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2893] / [Intel XE#7304])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#7413]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2387] / [Intel XE#7429]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406] / [Intel XE#7345])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_psr@fbc-psr2-primary-render@edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#1406]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_psr@pr-primary-page-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#5821])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2330] / [Intel XE#5813])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3904] / [Intel XE#7342])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2413])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#5857])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [PASS][132] -> [FAIL][133] ([Intel XE#4227] / [Intel XE#7397])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@kms_vrr@flip-basic-fastset.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][134] -> [FAIL][135] ([Intel XE#6293] / [Intel XE#7397])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#5949] / [Intel XE#9277])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_vrr@negative-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1499] / [Intel XE#9271])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_vrr@negative-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#6599])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][140] -> [INCOMPLETE][141] ([Intel XE#6321] / [Intel XE#8355])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#5764]) +10 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][143] ([Intel XE#6321] / [Intel XE#8355])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#8370]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#6144]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][146] ([Intel XE#7482]) +13 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#7482]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][149] ([Intel XE#5575] / [Intel XE#7484]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1392]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#8374]) +12 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#8374])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#8374]) +14 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#9003])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#9003])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#8364]) +19 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#8364]) +26 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@one-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#8364]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-basic.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#8369])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#8369]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-ptl:          NOTRUN -> [SKIP][161] ([Intel XE#8369]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:
    - shard-bmg:          [PASS][162] -> [FAIL][163] ([Intel XE#8528])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [PASS][164] -> [FAIL][165] ([Intel XE#9096])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#9096])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#8378]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
    - shard-ptl:          NOTRUN -> [SKIP][169] ([Intel XE#8378]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-fd-basic:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#8378]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-fd-basic.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2833])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_madvise@atomic-global:
    - shard-ptl:          NOTRUN -> [SKIP][172] ([Intel XE#7980])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_madvise@atomic-global.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#6964]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#7793])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@xe_page_reclaim@random.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#7590])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-9/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xelp:
    - shard-ptl:          NOTRUN -> [SKIP][177] ([Intel XE#5771] / [Intel XE#7590])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2245] / [Intel XE#7590])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][179] ([Intel XE#5741]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#584] / [Intel XE#7369])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-mocs:
    - shard-ptl:          NOTRUN -> [SKIP][181] ([Intel XE#6867]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][182] ([Intel XE#7727])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][183] -> [ABORT][184] ([Intel XE#9362]) +2 other tests abort
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-ptl:          NOTRUN -> [SKIP][185] ([Intel XE#5611] / [Intel XE#7456])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-ptl:          NOTRUN -> [SKIP][186] ([Intel XE#7271])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-ptl:          NOTRUN -> [SKIP][188] ([Intel XE#6019])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_query@multigpu-query-engines.html
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#944])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#944])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][191] -> [FAIL][192] ([Intel XE#6569])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_survivability@i2c-functionality:
    - shard-ptl:          NOTRUN -> [SKIP][194] ([Intel XE#8415] / [Intel XE#8432])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_survivability@i2c-functionality.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-ptl:          NOTRUN -> [SKIP][195] ([Intel XE#7892])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][196] ([Intel XE#8583]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][198] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
    - shard-ptl:          [FAIL][200] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][202] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#9320]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][206] ([Intel XE#1503]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-ptl:          [FAIL][208] ([Intel XE#9340]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-ptl:          [ABORT][210] ([Intel XE#9362]) -> [PASS][211] +3 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-bmg:          [DMESG-WARN][212] ([Intel XE#9390]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
    - shard-lnl:          [FAIL][214] ([Intel XE#8399]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][216] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][217] +3 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [FAIL][218] ([Intel XE#9096]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-ptl:          ([PASS][220], [PASS][221], [PASS][222], [PASS][223], [SKIP][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245]) ([Intel XE#9286]) -> ([PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-5/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_module_load@load.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][271] ([Intel XE#7727]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][273] ([Intel XE#8966]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-2/igt@xe_survivability@runtime-survivability.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][275] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][276] ([Intel XE#301])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8528
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320
  [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
  [Intel XE#9340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9114 -> IGTPW_15914

  IGTPW_15914: 53c96d170c9e192acb59ece244583a14c81e217b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb805db28a33eab2c9a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/index.html

--===============8479973611692670741==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: update ignored=
 dmesg regex (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170062/">https://patchwork.freedesktop.org/series/170062/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15914/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15914/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9114_FULL -&gt; XEIGTPW_15914_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15914_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225=
">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_big_fb@linear-16bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5808">Intel XE#5808</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_big_fb@x-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/585=
0">Intel XE#5850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_big_fb@x-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_bw@connected-linear-tiling-3=
-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-=
target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-=
target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5822">Intel XE#5822</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/92=
05">Intel XE#9205</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5824">Intel XE#5824</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_chamelium_sharpness_filter@f=
ilter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6507">Intel XE#6507</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_chamelium_sharpness_filter@f=
ilter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-c-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt=
2020@pipe-a-plane-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@kms_color_pipeline@plane-fix=
ed-matrix-yuv-rgb-bt2020@pipe-a-plane-3.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +14 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-pla=
ne-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_color_pipeline@plane-fixed-m=
atrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +41 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane=
-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_color_pipeline@plane-fixed-m=
atrix-yuv-rgb-bt709-lim@pipe-a-plane-3.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +15 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail<=
/li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5832">Intel XE#5832</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats-big=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-=
with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_feature_discovery@dsc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/92=
87">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1591=
4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#73=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_force_connector_basic@force-=
connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-sh=
rfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_frontbuffer_tracking@drrshdr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr=
-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-abg=
r161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-arg=
b161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +61 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-abg=
r161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-ar=
gb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-arg=
b161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +43 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_hdmi_audio_bw@audio-bw-hblan=
k160.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-6/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/s=
hard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7378">Intel XE#7378</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/s=
hard-bmg-9/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">Intel XE#9093=
</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-m=
odifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-5/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15914/shard-ptl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
362">Intel XE#9362</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_plane_multiple@tiling-x.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584=
9">Intel XE#5849</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other te=
st skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a=
>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7413">Intel XE#7413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7429">Intel XE#7429</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_psr@fbc-psr2-primary-render@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_psr@pr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-10/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-6/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-=
7/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_159=
14/shard-ptl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel =
XE#6293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949"=
>Intel XE#5949</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9277">Intel XE#9277</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@xe_evict@evict-beng-large-multi-=
vm-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15914/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_evict@evict-cm-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_evict@evict-mixed-many-thread=
s-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@xe_evict@evict-small-multi-queue=
-priority-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_exec_balancer@many-execqueues=
-virtual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +13 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@xe_exec_balancer@twice-virtual-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-qu=
eue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_exec_fault_mode@once-multi-qu=
eue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@xe_exec_mix_modes@exec-multi-que=
ue-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_exec_mix_modes@exec-multi-que=
ue-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +19 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-ba=
sic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@xe_exec_reset@cm-multi-queue-clo=
se-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-er=
ror.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_exec_reset@multi-queue-cat-er=
ror-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-mma=
p-huge-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@xe_exec_system_allocator@process=
-many-stride-mmap-huge-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8528">Intel XE#8528</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-=
race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15914/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invali=
date-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9096">Intel XE#9096</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-=
race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15914/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invali=
date-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@xe_exec_threads@threads-multi-qu=
eue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</l=
i>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_exec_threads@threads-multi-qu=
eue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@xe_exec_threads@threads-multi-qu=
eue-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
3">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_madvise@atomic-global.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/798=
0">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7323">Intel XE#7323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_multigpu_svm@mgpu-pagefault-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-6/igt@xe_page_reclaim@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793"=
>Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-9/igt@xe_pat@l2-flush-opt-svm-pat-rest=
rict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">=
Intel XE#5771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel=
 XE#5741</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-3/igt@xe_pm@s3-basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE=
#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE=
#6867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_pm@s4-basic-exec.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
27">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-lnl=
-5/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other t=
ests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5611">Intel XE#5611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_pm_residency@aspm_link_reside=
ncy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6019">Intel XE#6019</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-6/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-b=
mg-10/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-lnl-7/igt@xe_sriov_vram@vf-access-beyond.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_survivability@i2c-functionali=
ty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8415">Intel XE#8415</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-l=
r-external-nodefer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1591=
4/shard-bmg-7/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
18">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@kms_async_flips@alternate-=
sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@kms_flip@flip-v=
s-expired-vblank-interruptible@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank=
@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161=
616f.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9320">Intel XE#9320</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15914/shard-bmg-3/igt@kms_hdr@bpc-switch-susp=
end@pipe-a-dp-2-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/sha=
rd-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-c=
lamping@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9340">Intel XE#9340</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@kms_plane@p=
ixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">In=
tel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15914/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html">PASS<=
/a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390=
">Intel XE#9390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15914/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PA=
SS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Inte=
l XE#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15914/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel X=
E#4227</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7397">Intel XE#7397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15914/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalida=
te-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9096">Intel XE#9096</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15914/shard-bmg-1/igt@xe_exec_threads@threads-ha=
ng-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9114/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9114/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9114/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9114/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-pt=
l-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard=
-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/sh=
ard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114=
/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9=
114/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_9114/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_9114/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_9114/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286">Intel XE#9286=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_159=
14/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15914/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15914/shard-ptl-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/sha=
rd-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15914/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15914/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15914/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-pt=
l-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914=
/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15914/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15914/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15914/shard-ptl-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/shard=
-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15914/shard-ptl-7/igt@xe_module_load@load.ht=
ml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-8/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15914/sha=
rd-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-bmg-2/igt@xe_survivability@runtime-survivability.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8966">Intel XE#8966</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15914/shard-bmg-4/igt@xe_survivability@runtime-survivabilit=
y.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
1">Intel XE#301</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9114 -&gt; IGTPW_15914</li>
</ul>
<p>IGTPW_15914: 53c96d170c9e192acb59ece244583a14c81e217b @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb=
805db28a33eab2c9a</p>

</body>
</html>

--===============8479973611692670741==--
