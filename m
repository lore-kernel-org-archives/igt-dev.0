Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564BBC43458
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 17:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132910F083;
	Wed,  1 Jul 2026 17:37:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AD310F083;
 Wed,  1 Jul 2026 17:36:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2743217482727287590=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel/kms=5Fpsr2=5Fs?=
 =?utf-8?q?f=3A_Restrict_ET_validation_to_eDP_only_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 Jul 2026 17:36:46 -0000
Message-ID: <178292740646.139769.3973397375121392459@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
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

--===============2743217482727287590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr2_sf: Restrict ET validation to eDP only (rev2)
URL   : https://patchwork.freedesktop.org/series/168234/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8989_FULL -> XEIGTPW_15454_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15454_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15454_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15454_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_oa@polling:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-9/igt@xe_oa@polling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@xe_oa@polling.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15454_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#7445])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-8/igt@intel_hwmon@hwmon-write.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328] / [Intel XE#7367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#8365])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +9 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325] / [Intel XE#7358])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6507])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6974]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2286] / [Intel XE#6035])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4210] / [Intel XE#7467])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#4354] / [Intel XE#5882])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4354] / [Intel XE#5882])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4331] / [Intel XE#7227])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#8265])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8265])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4422] / [Intel XE#7442])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6126] / [Intel XE#776])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1421])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#656] / [Intel XE#7905]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061] / [Intel XE#7356])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4141]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2311]) +39 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7905]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7399])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7865]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7061]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +43 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#1503])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6911] / [Intel XE#7466])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6900] / [Intel XE#7362])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8348])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7283]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4608])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#4608] / [Intel XE#7304])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1489]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7795])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2330] / [Intel XE#5813])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6503]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1499])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@xe_compute@eu-busy-10s.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [PASS][69] -> [ABORT][70] ([Intel XE#8536]) +1 other test abort
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7636]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7636]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6540] / [Intel XE#688])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][74] -> [INCOMPLETE][75] ([Intel XE#6321] / [Intel XE#8355]) +1 other test incomplete
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7482]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@xe_exec_balancer@once-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1392])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#8374]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8374]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#8364]) +19 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#8364]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8378]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#8378]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][85] -> [ABORT][86] ([Intel XE#8007]) +2 other tests abort
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-9/igt@xe_module_load@reload-no-display.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-1/igt@xe_module_load@reload-no-display.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#6964]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6964])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#7793]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@xe_page_reclaim@invalid-1g.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#7793])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-1/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#5694] / [Intel XE#7370])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#944])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_query@multigpu-query-config.html
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#944]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#3342])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#8339])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7892])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@unused-pitches:
    - shard-lnl:          [ABORT][98] ([Intel XE#8007]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-2/igt@kms_addfb_basic@unused-pitches.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][100] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][102] ([Intel XE#7571]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][104] ([Intel XE#7308]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [ABORT][106] ([Intel XE#8007]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_pat@pt-caching-update-pat-and-pte:
    - shard-bmg:          [ABORT][108] ([Intel XE#7893] / [Intel XE#8300]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-8/igt@xe_pat@pt-caching-update-pat-and-pte.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_pat@pt-caching-update-pat-and-pte.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][110] ([Intel XE#7992]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][112] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][113] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [SKIP][114] ([Intel XE#656] / [Intel XE#7905]) -> [ABORT][115] ([Intel XE#8007])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][116] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][117] ([Intel XE#2426] / [Intel XE#5848])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8536
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8989 -> IGTPW_15454

  IGTPW_15454: 15454
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5315-e913ff3ff5099aa149bb820ca68e3cf8642b273e: e913ff3ff5099aa149bb820ca68e3cf8642b273e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/index.html

--===============2743217482727287590==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr2_sf: Restrict ET validation to eDP only (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168234/">https://patchwork.freedesktop.org/series/168234/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8989_FULL -&gt; XEIGTPW_15454_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15454_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15454_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15454_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_oa@polling:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-9/igt@xe_oa@polling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@xe_oa@polling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15454_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126">Intel XE#6126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592">Intel XE#6592</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391">Intel XE#7391</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8536">Intel XE#8536</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-6/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-7/igt@xe_exec_balancer@once-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-9/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-1/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-9/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-1/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-2/igt@kms_addfb_basic@unused-pitches.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-5/igt@kms_addfb_basic@unused-pitches.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-update-pat-and-pte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-8/igt@xe_pat@pt-caching-update-pat-and-pte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-10/igt@xe_pat@pt-caching-update-pat-and-pte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8989/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15454/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8989 -&gt; IGTPW_15454</li>
</ul>
<p>IGTPW_15454: 15454<br />
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5315-e913ff3ff5099aa149bb820ca68e3cf8642b273e: e913ff3ff5099aa149bb820ca68e3cf8642b273e</p>

</body>
</html>

--===============2743217482727287590==--
