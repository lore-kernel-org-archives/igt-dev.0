Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56244FED3CC
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 14:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F239C10F5EB;
	Fri, 24 Apr 2026 14:37:41 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3110F5E0;
 Fri, 24 Apr 2026 14:37:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7875183505246842247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/oa=3A_Wa=5F14026633?=
 =?utf-8?q?728?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 Apr 2026 14:37:29 -0000
Message-ID: <177704144906.7267.13397538961279042124@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424081354.3033523-1-shekhar.chauhan@intel.com>
In-Reply-To: <20260424081354.3033523-1-shekhar.chauhan@intel.com>
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

--===============7875183505246842247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Wa_14026633728
URL   : https://patchwork.freedesktop.org/series/165409/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8873_FULL -> XEIGTPW_15050_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15050_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15050_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15050_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +37 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_reset@cat-error:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@xe_exec_reset@cat-error.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_reset@cat-error.html

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-bmg:          [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  * igt@xe_sriov_scheduling@equal-throughput@numvfs-random:
    - shard-bmg:          [PASS][10] -> [DMESG-FAIL][11] +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][12] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [TIMEOUT][13] +1 other test timeout
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@kms_content_protection@atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][14] ([Intel XE#6321]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15050_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2134]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@fbdev@nullptr.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2233])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#7825]) +49 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7825]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][28] ([Intel XE#7084])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3432])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#306] / [Intel XE#7358])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_color@degamma:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#3297]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_color@degamma.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_color@degamma.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7642])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#6707] / [Intel XE#7439])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#309] / [Intel XE#7343])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1340] / [Intel XE#7435])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_aux_dev@basic:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#3009])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_dp_aux_dev@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2244])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4156] / [Intel XE#7425])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2316])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@absolute-wf_vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#7705]) +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_flip@absolute-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2482])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-panning:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2482]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@kms_flip@flip-vs-panning.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#5408] / [Intel XE#6266]) +3 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#7178]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2380]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7178] / [Intel XE#7351])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2682])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#6312])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#656]) +10 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4141]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2313]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2548] / [Intel XE#6314])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#7308])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2568]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@kms_invalid_mode@int-max-clock.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#7283])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7283]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7130]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7283])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#7111]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_plane@pixel-format-x-tiled-modifier.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@plane-position-covered:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#7111])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#7082]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#3307])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2763] / [Intel XE#6886]) +19 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7376] / [Intel XE#870])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#4886])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_pm_rpm@legacy-planes.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2893] / [Intel XE#7304])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2387] / [Intel XE#7429])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1406]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#6503]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vblank@wait-busy:
    - shard-bmg:          [PASS][101] -> [FAIL][102] ([Intel XE#7762]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_vblank@wait-busy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_vblank@wait-busy.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2168] / [Intel XE#7444])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_vrr@lobf.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-4/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#7319] / [Intel XE#7350] / [Intel XE#944])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#6568])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@xe_eu_stall@blocking-re-enable.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#7636]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-4/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#7636]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#7482]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@xe_exec_balancer@once-cm-parallel-userptr.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#7827]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_exec_balancer@once-virtual-rebind.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1392])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7136]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#7136]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#7826]) +26 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6874]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#6874]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#7824]) +16 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#7824]) +270 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#7138]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [PASS][126] -> [ABORT][127] ([Intel XE#7578])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#2229])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#6964])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#7793])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-5/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@false-sharing:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#7590])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_pat@false-sharing.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2284] / [Intel XE#7370])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2284] / [Intel XE#7370])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#584] / [Intel XE#7369])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#7770]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-lnl-8/igt@xe_pmu@gt-frequency.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#944]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4130] / [Intel XE#7366])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][140] -> [FAIL][141] ([Intel XE#6569])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][142] ([Intel XE#6627] / [Intel XE#7419])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_survivability@runtime-survivability.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [PASS][143] -> [DMESG-WARN][144] ([Intel XE#5545])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@fbdev@pan:
    - shard-bmg:          [FAIL][145] ([Intel XE#2488]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@fbdev@pan.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@fbdev@pan.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][147] ([Intel XE#2134]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@fbdev@unaligned-read.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][149] ([Intel XE#7445]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][151] ([Intel XE#3297]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_color@ctm-red-to-blue.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          [SKIP][153] ([Intel XE#7006]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][155] ([Intel XE#2316]) -> [PASS][156] +6 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][157] ([Intel XE#4882]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][159] ([Intel XE#2482]) -> [PASS][160] +3 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-bmg:          [SKIP][161] ([Intel XE#7178]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][163] ([Intel XE#2380]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-bmg:          [SKIP][165] ([Intel XE#2568]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_invalid_mode@clock-too-high.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][167] ([Intel XE#7086]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-bmg:          [SKIP][169] ([Intel XE#7825]) -> [PASS][170] +61 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-bmg:          [SKIP][171] ([Intel XE#7283]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [SKIP][173] ([Intel XE#7111]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][175] ([Intel XE#2571] / [Intel XE#7343]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-bmg:          [SKIP][177] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][178] +19 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][179] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][181] ([Intel XE#7079]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_pm_rpm@i2c.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-bmg:          [SKIP][183] ([Intel XE#7112]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_properties@crtc-properties-legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_properties@crtc-properties-legacy.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-bmg:          [SKIP][185] ([Intel XE#6568]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - shard-bmg:          [SKIP][187] ([Intel XE#7827]) -> [PASS][188] +2 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - shard-bmg:          [SKIP][189] ([Intel XE#7826]) -> [PASS][190] +21 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  * igt@xe_exec_store@mem-write-ordering-check:
    - shard-bmg:          [FAIL][191] -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_exec_store@mem-write-ordering-check.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@xe_exec_store@mem-write-ordering-check.html

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - shard-bmg:          [SKIP][193] ([Intel XE#7824]) -> [PASS][194] +296 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_exec_system_allocator@many-free-race-nomemset.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_exec_system_allocator@many-free-race-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [ABORT][195] ([Intel XE#5545]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][197], [PASS][198], [PASS][199], [PASS][200], [SKIP][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-bmg:          [SKIP][248] ([Intel XE#6964]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@xe_multigpu_svm@mgpu-migration-basic.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          [SKIP][250] ([Intel XE#7590]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_pat@display-vs-wb-transient.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][252] ([Intel XE#7695]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [SKIP][254] -> [PASS][255] +36 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@vm-get-property-exercise:
    - shard-bmg:          [DMESG-FAIL][256] -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_vm@vm-get-property-exercise.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_vm@vm-get-property-exercise.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][258] ([Intel XE#7825]) -> [SKIP][259] ([Intel XE#2327]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][260] ([Intel XE#2327]) -> [SKIP][261] ([Intel XE#7825]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][262] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][263] ([Intel XE#7825])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][264] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][265] ([Intel XE#7825])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][266] ([Intel XE#7825]) -> [SKIP][267] ([Intel XE#1124]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][268] ([Intel XE#1124]) -> [SKIP][269] ([Intel XE#7825]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][270] ([Intel XE#7825]) -> [SKIP][271] ([Intel XE#2887]) +15 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][272] ([Intel XE#7825]) -> [INCOMPLETE][273] ([Intel XE#7084])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][274] ([Intel XE#3432]) -> [SKIP][275] ([Intel XE#7825])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][276] ([Intel XE#2887]) -> [SKIP][277] ([Intel XE#7825]) +15 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][278] ([Intel XE#2652]) -> [SKIP][279] ([Intel XE#7825])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][280] -> [SKIP][281] ([Intel XE#2724] / [Intel XE#7449])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_cdclk@mode-transition.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][282] ([Intel XE#7825]) -> [SKIP][283] ([Intel XE#6974])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][284] ([Intel XE#7825]) -> [SKIP][285] ([Intel XE#2390] / [Intel XE#6974])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][286] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][287] ([Intel XE#7825])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_content_protection@srm.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [SKIP][288] ([Intel XE#7825]) -> [FAIL][289] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_content_protection@suspend-resume.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][290] ([Intel XE#7825]) -> [SKIP][291] ([Intel XE#7642])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_content_protection@type1.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][292] ([Intel XE#7825]) -> [FAIL][293] ([Intel XE#6707] / [Intel XE#7439])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_content_protection@uevent.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][294] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][295] ([Intel XE#7825]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][296] ([Intel XE#7825]) -> [SKIP][297] ([Intel XE#2321] / [Intel XE#7355])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][298] ([Intel XE#7825]) -> [SKIP][299] ([Intel XE#2320]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][300] ([Intel XE#2320]) -> [SKIP][301] ([Intel XE#7825]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][302] ([Intel XE#7825]) -> [SKIP][303] ([Intel XE#2286] / [Intel XE#6035])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][304] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][305] ([Intel XE#7825])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][306] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][307] ([Intel XE#7825])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][308] ([Intel XE#7825]) -> [SKIP][309] ([Intel XE#4354] / [Intel XE#5870])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][310] ([Intel XE#7825]) -> [SKIP][311] ([Intel XE#2244])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-bmg:          [SKIP][312] ([Intel XE#2482]) -> [FAIL][313] ([Intel XE#7705])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip@absolute-wf_vblank.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][314] ([Intel XE#7178]) -> [SKIP][315] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][316] ([Intel XE#2380]) -> [SKIP][317] ([Intel XE#7178] / [Intel XE#7351])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][318] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][319] ([Intel XE#2380])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][320] ([Intel XE#2311]) -> [SKIP][321] ([Intel XE#2312]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][322] ([Intel XE#2311]) -> [SKIP][323] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +17 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][324] ([Intel XE#4141]) -> [SKIP][325] ([Intel XE#6314]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][326] ([Intel XE#6314]) -> [SKIP][327] ([Intel XE#4141]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][328] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][329] ([Intel XE#4141]) +11 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][330] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][331] ([Intel XE#2312])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][332] ([Intel XE#4141]) -> [SKIP][333] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +11 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-bmg:          [SKIP][334] ([Intel XE#4141]) -> [SKIP][335] ([Intel XE#2548] / [Intel XE#6314]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][336] ([Intel XE#6314]) -> [SKIP][337] ([Intel XE#2311]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][338] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][339] ([Intel XE#2311]) +18 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][340] ([Intel XE#2311]) -> [SKIP][341] ([Intel XE#2548] / [Intel XE#6314]) +4 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][342] ([Intel XE#2312]) -> [SKIP][343] ([Intel XE#2311])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][344] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][345] ([Intel XE#2311]) +5 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][346] ([Intel XE#2313]) -> [SKIP][347] ([Intel XE#6314]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][348] ([Intel XE#6314]) -> [SKIP][349] ([Intel XE#2313]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][350] ([Intel XE#2313]) -> [SKIP][351] ([Intel XE#2312]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][352] ([Intel XE#6314]) -> [SKIP][353] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][354] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][355] ([Intel XE#4141]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][356] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][357] ([Intel XE#2313]) +19 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][358] ([Intel XE#2312]) -> [SKIP][359] ([Intel XE#2548] / [Intel XE#6314])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][360] ([Intel XE#2313]) -> [SKIP][361] ([Intel XE#2548] / [Intel XE#6314]) +21 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][362] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][363] ([Intel XE#6314]) +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][364] -> [SKIP][365] ([Intel XE#6911] / [Intel XE#7378])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][366] ([Intel XE#7825]) -> [SKIP][367] ([Intel XE#6912] / [Intel XE#7375])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][368] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][369] ([Intel XE#7825])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][370] ([Intel XE#7825]) -> [SKIP][371] ([Intel XE#5020] / [Intel XE#7348]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][372] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][373] ([Intel XE#7825])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][374] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][375] ([Intel XE#7825]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][376] ([Intel XE#7825]) -> [SKIP][377] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][378] ([Intel XE#6361]) -> [SKIP][379] ([Intel XE#1435])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@kms_setmode@basic.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_setmode@basic.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][380] ([Intel XE#6503]) -> [SKIP][381] ([Intel XE#7825])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@kms_sharpness_filter@filter-formats.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][382] ([Intel XE#7825]) -> [SKIP][383] ([Intel XE#6503]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][384] ([Intel XE#7825]) -> [SKIP][385] ([Intel XE#1499]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@kms_vrr@flip-suspend.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][386] ([Intel XE#1499]) -> [SKIP][387] ([Intel XE#7825])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-vrr.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][388] -> [SKIP][389] ([Intel XE#7140]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][390] ([Intel XE#7826]) -> [SKIP][391] ([Intel XE#7136]) +13 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][392] ([Intel XE#7136]) -> [SKIP][393] ([Intel XE#7826]) +6 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][394] ([Intel XE#7098]) -> [SKIP][395] ([Intel XE#7824])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7079]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#7762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7762
  [Intel XE#7770]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7770
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824
  [Intel XE#7825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825
  [Intel XE#7826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826
  [Intel XE#7827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8873 -> IGTPW_15050

  IGTPW_15050: 563f4fcd7564d4b083e10a9af32a26711a77b1e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/index.html

--===============7875183505246842247==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Wa_14026633728</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165409/">https://patchwork.freedesktop.org/series/165409/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15050/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15050/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8873_FULL -&gt; XEIGTPW_15050_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15050_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15050_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
050_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">FAIL</a> +7 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shar=
d-bmg-9/igt@xe_evict@evict-large-external-cm.html">SKIP</a> +37 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_evict@evict-threads-small-mul=
ti-queue.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@xe_exec_reset@cat-error.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/i=
gt@xe_exec_reset@cat-error.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_pa=
rse.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15050/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-xe_sync_entr=
y_parse.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput@numvfs-rand=
om.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15050/shard-bmg-9/igt@xe_sriov_scheduling@equal-throughput@numvfs-r=
andom.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_content_protection@a=
tomic.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15050_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@fbdev@n=
ullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15050/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
33">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-1=
80-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-=
rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7825">Intel XE#7825</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_color@degamma.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@k=
ms_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3297">Intel XE#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_content_protection@uevent@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@=
kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Inte=
l XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_flip@2x-modeset-vs-vblank-race-interruptibl=
e.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15050/shard-bmg-9/igt@kms_flip@2x-modeset-vs-vblank-race-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_flip@absolute-wf_vblank@b-dp=
2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7705">Intel XE#7705</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip@flip-vs-modeset-vs-hang=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-6/igt@kms_flip@flip-vs-panning.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/=
igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15050/shard-bmg-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5408">Intel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6266">Intel XE#6266</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4t=
ile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xt=
ile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-xti=
le-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/sh=
ard-bmg-9/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p=
-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel=
 XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-ar=
gb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-b=
mg-9/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@kms_invalid_mode@int-max-clock.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-=
bmg-9/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15050/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-=
modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_plane@pixel-format-x-tiled-modifier.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
50/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel =
XE#7111</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane@plane-position-covered=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7111">Intel XE#7111</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15050/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">=
Intel XE#7082</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with=
-modifiers@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane_scaling@plane-upscal=
e-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9=
/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bm=
g-9/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383"=
>Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_psr@psr2-primary-page-flip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_sharpness_filter@invalid-pla=
ne-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_vblank@wait-busy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@=
kms_vblank@wait-busy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7762">Intel XE#7762</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_vrr@lobf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE=
#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-4/igt@xe_create@create-big-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
62">Intel XE#1062</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7318">Intel XE#7318</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7350">Intel XE#7350</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-6/igt@xe_eu_stall@blocking-re-enable.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-=
bmg-9/igt@xe_eu_stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-4/igt@xe_eudebug@basic-client.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636=
">Intel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-discove=
ry.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@xe_exec_balancer@once-cm-paralle=
l-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@xe_exec_balancer@once-virtual-rebind.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/=
shard-bmg-9/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#782=
7</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-qu=
eue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-q=
ueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
50/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel =
XE#7826</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-pr=
eempt-mode-fault-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_system_allocator@many-64=
k-malloc-prefetch-madvise.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-mall=
oc-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_system_allocator@process-many-la=
rge-malloc-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7824">Intel XE#7824</a>) +270 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-3/igt@xe_exec_threads@threads-multi-qu=
eue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-x=
e_device_create.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@xe_fault_injection@inject-fault-=
probe-function-xe_device_create.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15050/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefault-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-5/igt@xe_page_reclaim@prl-max-entries.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@false-sharing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_pat@false-sharing.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">I=
ntel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-lnl-8/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-lnl-2/igt@x=
e_pmu@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7770">Intel XE#7770</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard=
-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_survivability@runtime-surviva=
bility.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard=
-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a=
>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@fbdev@pan.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2488">Intel XE#2488</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/=
igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@fbdev@unaligned-read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/sh=
ard-bmg-10/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1505=
0/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_color@ctm-red-to-blue.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#329=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
50/shard-bmg-10/igt@kms_color@ctm-red-to-blue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
06">Intel XE#7006</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15050/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3=
x4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15050/shard-bmg-10/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +6 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
882">Intel XE#4882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15050/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop-interrupti=
ble.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">In=
tel XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15050/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS=
</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4t=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_flip_scaled_c=
rc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_flip_scaled_cr=
c@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel =
XE#2568</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15050/shard-bmg-10/igt@kms_invalid_mode@clock-too-high.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Inte=
l XE#7086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15050/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825=
">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15050/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-untiled.h=
tml">PASS</a> +61 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283=
">Intel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15050/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7111">Intel XE#7111</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_plane@plane-panning-bottom-right=
-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with=
-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@k=
ms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">PASS<=
/a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">In=
tel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7402">Intel XE#7402</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_pm_rpm@dpms-mode=
-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7079">Intel XE#7079</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bm=
g-3/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_properties@crtc-properties-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">=
Intel XE#7112</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15050/shard-bmg-2/igt@kms_properties@crtc-properties-legacy.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Inte=
l XE#6568</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15050/shard-bmg-1/igt@xe_eu_stall@invalid-sampling-rate.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7827">Intel XE#7827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_exec_balancer@no-exec-cm-parallel-r=
ebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7826">Intel XE#7826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-inval=
idate.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@mem-write-ordering-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_exec_store@mem-write-ordering-check.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1505=
0/shard-bmg-2/igt@xe_exec_store@mem-write-ordering-check.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_exec_system_allocator@many-free-race-nomemset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7824">Intel XE#7824</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_exec_system_allocator@many-fre=
e-race-nomemset.html">PASS</a> +296 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wopcm_init.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_fault_injection@i=
nject-fault-probe-function-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8873/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8873/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8873/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8873/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/=
shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-5/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_88=
73/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8873/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8873/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8873/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8873/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#245=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405=
">Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15050/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
50/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15050/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15050/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15050/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@xe_mo=
dule_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">I=
ntel XE#6964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15050/shard-bmg-9/igt@xe_multigpu_svm@mgpu-migration-basic.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel X=
E#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15050/shard-bmg-5/igt@xe_pat@display-vs-wb-transient.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel X=
E#7695</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15050/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/s=
hard-bmg-8/igt@xe_sriov_vram@vf-access-provisioned.html">PASS</a> +36 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-exercise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_vm@vm-get-property-exercise.html">DMESG-FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/=
shard-bmg-10/igt@xe_vm@vm-get-property-exercise.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Int=
el XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15050/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15050/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Inte=
l XE#7825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@li=
near-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">=
Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7387">Intel XE#7387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15050/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">In=
tel XE#7825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled=
-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-c=
cs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +15 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/265=
2">Intel XE#2652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15050/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_cdclk@mode-transition.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8=
/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-=
type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/782=
5">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15050/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_content_protection@srm.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1=
178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
04">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_content_protection@srm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_content_protection@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">=
Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15050/shard-bmg-10/igt@kms_content_protection@suspend-resume.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#=
7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15050/shard-bmg-1/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE=
#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15050/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#670=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439=
">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825"=
>Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15050/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">I=
ntel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15050/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320=
">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15050/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">In=
tel XE#7825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@k=
ms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE=
#4210</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7467">Intel XE#7467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825=
">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7386">Intel XE#7386</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825=
">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE=
#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15050/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#43=
54</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/587=
0">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">In=
tel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15050/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">=
Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2=
482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5050/shard-bmg-6/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_flip_sca=
led_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel X=
E#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7349">Intel XE#7349</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_flip_scaled_cr=
c@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel=
 XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">In=
tel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@=
drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel=
 XE#6314</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_track=
ing@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2434">Intel XE#2434</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">In=
tel XE#4141</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2434">Intel XE#2434</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-b=
mg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel X=
E#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6314">Intel XE#6314</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-indf=
b-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pr=
i-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-3/igt@kms_frontbuffer_t=
racking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shr=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2434">Intel XE#2434</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bm=
g-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314"=
>Intel XE#6314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer_=
tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffe=
r_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#63=
14</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-7/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-6/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15050/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bcpsr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">=
Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-=
fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-1/igt@kms_=
frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel=
 XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel X=
E#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel=
 XE#6314</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_frontbuffer_tr=
acking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard-b=
mg-10/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#73=
78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825=
">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15050/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel =
XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7377">Intel XE#7377</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#=
7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15050/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348"=
>Intel XE#7348</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Inte=
l XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@kms_rotation_crc@prim=
ary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">In=
tel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15050/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">=
Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/shard=
-bmg-9/igt@kms_setmode@basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-7/igt@kms_sharpness_filter@filter-formats.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">In=
tel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15050/shard-bmg-9/igt@kms_sharpness_filter@filter-formats.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">=
Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling=
-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15050/shard-bmg-5/igt@kms_sharpness_filter@invalid=
-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15050/sh=
ard-bmg-3/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15050/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#=
7825</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority-cm.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15050/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/71=
40">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebi=
nd-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15050/shard-bmg-10/igt@xe_exec_fault_mode@ma=
ny-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +13 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7136">Intel XE#7136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-=
userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7826">Intel XE#7826</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8873/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetc=
h.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7098">Intel XE#7098</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15050/shard-bmg-9/igt@xe_exec_system_allocator@m=
any-stride-new-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8873 -&gt; IGTPW_15050</li>
</ul>
<p>IGTPW_15050: 563f4fcd7564d4b083e10a9af32a26711a77b1e5 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed00=
2cf0df3c8ea8bd81e</p>

</body>
</html>

--===============7875183505246842247==--
