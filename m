Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF2CC6B2D
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 03:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04BE10E535;
	Thu, 15 Oct 2026 03:21:20 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0210E698;
 Thu, 15 Oct 2026 03:20:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1454992106991125754=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_xe=5Fpmu=3A_Do_not_enable_?=
 =?utf-8?q?VFs_in_unrelated_subtests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 15 Oct 2026 03:20:31 -0000
Message-ID: <179203443181.26925.6923946605039765045@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261014081759.1111471-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261014081759.1111471-1-marcin.bernatowicz@linux.intel.com>
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

--===============1454992106991125754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_pmu: Do not enable VFs in unrelated subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/176050/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9145_FULL -> XEIGTPW_15985_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15985_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15985_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15985_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          NOTRUN -> [SKIP][1] +14 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_compute0.html

  
New tests
---------

  New tests have been introduced between XEIGT_9145_FULL and XEIGTPW_15985_FULL:

### New IGT tests (4) ###

  * igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_vblank@accuracy-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.40] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15985_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#6925]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5901]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5808]) +8 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5850])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5855])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#7679]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7679])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +12 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][16] -> [INCOMPLETE][17] ([Intel XE#7084] / [Intel XE#8150])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5822]) +13 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2724] / [Intel XE#7449])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5824]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#306] / [Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#8391])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7358]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6969]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#7642]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7642])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6974])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1468] / [Intel XE#7396])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7642])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5900]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2321] / [Intel XE#7355])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2320]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5846]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5962])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309] / [Intel XE#7343])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5962] / [Intel XE#7343])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#9529])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_dp_link_training@uhbr-sst-direct-train.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#9529])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#5907]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8265]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8680])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1421]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#2316]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#3321]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#301]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][58] -> [ABORT][59] ([Intel XE#9362]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3098]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5828]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#7178]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7178] / [Intel XE#7351])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7179])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5800] / [Intel XE#6312]) +11 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4141]) +13 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7061] / [Intel XE#7356])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#6312]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#6312] / [Intel XE#651])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +47 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#6312]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#7865]) +20 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#5812]) +62 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7061]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7865]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7399])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#7399]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#656] / [Intel XE#7905]) +10 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2313]) +37 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7905]) +15 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#7061]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7061]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#9312])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [ABORT][88] ([Intel XE#9362] / [Intel XE#9438]) +1 other test abort
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#1503])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#5917] / [Intel XE#6174])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#6900])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2486])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#8303]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#7283]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#7283]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#8076])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4596] / [Intel XE#5854])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#6886]) +14 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#8854])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2893] / [Intel XE#7304])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#7304]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4608])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4608] / [Intel XE#7304])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1489]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#5835]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#7345])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1406]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#1406]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2234])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7795])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2330] / [Intel XE#5813])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#5813])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#5821]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6503]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-ptl:          [PASS][121] -> [ABORT][122] ([Intel XE#9375]) +1 other test abort
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-7/igt@kms_vblank@ts-continuation-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr-desktop-mode:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#9271]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [FAIL][124] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8397])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#5948] / [Intel XE#9277])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1447] / [Intel XE#7469])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@create-big-vram:
    - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#5853] / [Intel XE#7457])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@xe_create@create-big-vram.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#8608])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#8608])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#5764]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#8370])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_balancer@once-parallel-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#7482]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@xe_exec_balancer@once-parallel-userptr.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#7482]) +18 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1392]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#5575] / [Intel XE#7484]) +8 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#8374]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#8374]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#8374]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8364]) +25 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@max-queues-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#8364]) +21 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@xe_exec_multi_queue@max-queues-dyn-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#8364]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#8369]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#8369])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#8369])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#8378]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#8378]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#8378]) +6 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_madvise@atomic-cpu:
    - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#7980])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_madvise@atomic-cpu.html

  * igt@xe_media_fill@media-fill:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#5830] / [Intel XE#7453])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@xe_media_fill@media-fill.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#9203])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@xe_mempage_offline@inject-duplicate-page.html
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#9203])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#6964])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#6964]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#6964]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#7793]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-ptl:          NOTRUN -> [SKIP][160] ([Intel XE#7793]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#7793])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#5741]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2284] / [Intel XE#7370])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-basic:
    - shard-ptl:          [PASS][164] -> [ABORT][165] ([Intel XE#9362]) +2 other tests abort
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-6/igt@xe_pm@s2idle-basic.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][168] -> [ABORT][169] ([Intel XE#9362])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-lnl-6/igt@xe_pm@s4-mocs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-ptl:          NOTRUN -> [ABORT][171] ([Intel XE#9362]) +2 other tests abort
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#944]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-ptl:          NOTRUN -> [SKIP][173] ([Intel XE#6019]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_ras@gpu-health:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#9588])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_ras@gpu-health.html
    - shard-ptl:          NOTRUN -> [SKIP][175] ([Intel XE#9588])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_ras@gpu-health.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][176] -> [FAIL][177] ([Intel XE#6569])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-ptl:          NOTRUN -> [SKIP][178] ([Intel XE#7892])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#7892])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-ptl:          [ABORT][180] ([Intel XE#9387]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [ABORT][182] ([Intel XE#9375]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-ptl:          [ABORT][184] ([Intel XE#9362]) -> [PASS][185] +2 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [FAIL][186] ([Intel XE#9313]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][188] ([Intel XE#8399]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][190] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [ABORT][192] ([Intel XE#9362] / [Intel XE#9581]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@xe_ccs@suspend-resume.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [ABORT][194] ([Intel XE#9362]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][196] ([Intel XE#8355]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][198] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-ptl:          [ABORT][200] ([Intel XE#9362] / [Intel XE#9375]) -> [ABORT][201] ([Intel XE#9375])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
    - shard-ptl:          [DMESG-WARN][202] ([Intel XE#9407]) -> [ABORT][203] ([Intel XE#9375])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][204] ([Intel XE#9346]) -> [FAIL][205] ([Intel XE#9319] / [Intel XE#9346])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
  [Intel XE#9407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9407
  [Intel XE#9438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529
  [Intel XE#9581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581
  [Intel XE#9588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588


Build changes
-------------

  * IGT: IGT_9145 -> IGTPW_15985
  * Linux: xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6 -> xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662

  IGTPW_15985: 3bbee583e719cdf3016db4eca927768d19d71425 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/index.html

--===============1454992106991125754==
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
<tr><td><b>Series:</b></td><td>xe_pmu: Do not enable VFs in unrelated subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176050/">https://patchwork.freedesktop.org/series/176050/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9145_FULL -&gt; XEIGTPW_15985_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15985_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15985_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15985_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_compute0:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_compute0.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9145_FULL and XEIGTPW_15985_FULL:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15985_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850">Intel XE#5850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855">Intel XE#5855</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438">Intel XE#9438</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-7/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-7/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948">Intel XE#5948</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469">Intel XE#7469</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853">Intel XE#5853</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@xe_exec_balancer@once-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@xe_exec_multi_queue@max-queues-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-4/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_madvise@atomic-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830">Intel XE#5830</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-10/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-1/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_page_reclaim@pat-index-xd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-6/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-5/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-lnl-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-6/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ras@gpu-health:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-5/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-7/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-8/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-2/igt@xe_vm@overcommit-nonfault-vram-no-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387">Intel XE#9387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@xe_ccs@suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581">Intel XE#9581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@xe_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9407">Intel XE#9407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/shard-bmg-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9145 -&gt; IGTPW_15985</li>
<li>Linux: xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6 -&gt; xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662</li>
</ul>
<p>IGTPW_15985: 3bbee583e719cdf3016db4eca927768d19d71425 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6<br />
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662</p>

</body>
</html>

--===============1454992106991125754==--
