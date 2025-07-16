Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE26C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 19:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683C310E26B;
	Wed, 16 Jul 2025 19:57:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B895B10E26B;
 Wed, 16 Jul 2025 19:57:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7322050566830394881=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2C1/1=5D_lib/xe/xe=5Fquery=3A_Add_EU_stall_info_to_xe=5Fdevic?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Jul 2025 19:57:25 -0000
Message-ID: <175269584574.167933.3285234066326667814@1538d3639d33>
X-Patchwork-Hint: ignore
References: <6d41938517a3ab1b79e105c89af1ed74b1beeceb.1752647058.git.harish.chegondi@intel.com>
In-Reply-To: <6d41938517a3ab1b79e105c89af1ed74b1beeceb.1752647058.git.harish.chegondi@intel.com>
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

--===============7322050566830394881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/1] lib/xe/xe_query: Add EU stall info to xe_device
URL   : https://patchwork.freedesktop.org/series/151678/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8460_FULL -> XEIGTPW_13479_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13479_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13479_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13479_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#5419]) -> [SKIP][6] +7 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#4501]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@xe_oa@buffer-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_oa@buffer-size.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13479_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#3768])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3768])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3768])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#619])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2907]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +188 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2724])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#4417]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#306]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1424])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#308]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2321])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2321]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1508])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#5428])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4354])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4294])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4294])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#4164] / [i915#4767])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1138])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2375])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1137])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1137])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2293]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1401] / [Intel XE#1745])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#455]) +12 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#651]) +23 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2311]) +22 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#5390]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#4208])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#656]) +15 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2312]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#651]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313]) +18 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#653]) +25 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1503])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4298])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#5021])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#5020]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#5020]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2763]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#3309])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3309])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#718])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1489]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2893])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4608]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1489]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1406]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4609])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2234])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1127])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#3414] / [Intel XE#3904])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#2883]) +4 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#2883]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2426])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][105] ([Intel XE#1729])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#362])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1499])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-7/igt@kms_vrr@negative-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#1499])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1091] / [Intel XE#2849])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1091] / [Intel XE#2849])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4837]) +10 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4837]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#4837]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4518])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4518])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#688]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2322]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1392]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1392])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#1392]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#288]) +13 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2360]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4943]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-3/igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4943]) +17 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4915]) +176 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][128] -> [FAIL][129] ([Intel XE#5018])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][130] ([Intel XE#5531])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#5100])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156]) -> ([PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [SKIP][181], [PASS][182]) ([Intel XE#378])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-436/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-436/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-435/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-464/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-436/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-435/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-464/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-435/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#3573]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_oa@disabled-read-error.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2838] / [Intel XE#979])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2236])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#979])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#1948])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2284]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#4650])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][190] -> [FAIL][191] ([Intel XE#4819]) +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#4733]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#4733]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#944]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#944])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-7/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#944]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#4814])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][198] ([Intel XE#911]) -> [PASS][199] +3 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][200] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][202] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][204] ([Intel XE#3124]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][206] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][208] ([Intel XE#2291]) -> [PASS][209] +3 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [DMESG-WARN][210] ([Intel XE#5354]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][212] ([Intel XE#4633]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][214] ([Intel XE#4302]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][216] ([Intel XE#1340]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][218] ([Intel XE#2316]) -> [PASS][219] +7 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][220] ([Intel XE#301]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][222] ([Intel XE#2049] / [Intel XE#2594]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-435/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][224] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#455]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][228] ([Intel XE#1503]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][230] ([Intel XE#2571]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][232] ([Intel XE#718]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][234] ([Intel XE#1435]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][236] ([Intel XE#4459]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1392]) -> [PASS][239] +5 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][240] ([Intel XE#3876]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#3876]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind-err.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind-err.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][244] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][245] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][246] ([Intel XE#3124]) -> [INCOMPLETE][247] ([Intel XE#3124] / [Intel XE#4345])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][248] ([Intel XE#2341]) -> [FAIL][249] ([Intel XE#1178])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_content_protection@legacy.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][250] ([Intel XE#1188]) -> [SKIP][251] ([Intel XE#2341])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-3/igt@kms_content_protection@uevent.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [INCOMPLETE][252] -> [SKIP][253] ([Intel XE#2293] / [Intel XE#2380])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][254] ([Intel XE#2312]) -> [SKIP][255] ([Intel XE#2311]) +19 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][256] ([Intel XE#2311]) -> [SKIP][257] ([Intel XE#2312]) +15 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][258] ([Intel XE#5390]) -> [SKIP][259] ([Intel XE#2312]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][260] ([Intel XE#2312]) -> [SKIP][261] ([Intel XE#5390]) +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][262] ([Intel XE#2313]) -> [SKIP][263] ([Intel XE#2312]) +14 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][264] ([Intel XE#2312]) -> [SKIP][265] ([Intel XE#2313]) +16 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][266] ([Intel XE#4596]) -> [SKIP][267] ([Intel XE#5021])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][268] ([Intel XE#2426]) -> [SKIP][269] ([Intel XE#2509])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#4915]) -> [SKIP][271] ([Intel XE#4208])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#4501] / [Intel XE#5103]) -> [SKIP][273] ([Intel XE#5103])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][275] ([Intel XE#3573]) +27 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][277] ([Intel XE#3573]) +6 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#5531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * IGT: IGT_8460 -> IGTPW_13479
  * Linux: xe-3418-3309055b0f5cf28f0dd124be1f8f08507a35aec1 -> xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f

  IGTPW_13479: 2847682743bc3ca3258f6f65399e361f1d49ff67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8460: 8460
  xe-3418-3309055b0f5cf28f0dd124be1f8f08507a35aec1: 3309055b0f5cf28f0dd124be1f8f08507a35aec1
  xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f: 69e98a7d66784ff8a833b2b7ef4290ae3f083c5f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/index.html

--===============7322050566830394881==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/1] lib/xe/xe_q=
uery: Add EU stall info to xe_device</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151678/">https://patchwork.freedesktop.org/series/151678/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13479/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13479/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8460_FULL -&gt; XEIGTPW_13479_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13479_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13479_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
479_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function=
-xe_wopcm_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_fault_injection@inject-fault=
-probe-function-xe_wopcm_init.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-=
433/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/541=
9">Intel XE#5419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13479/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.=
html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-463/igt@xe_oa@buffer-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/sha=
rd-dg2-466/igt@xe_oa@buffer-size.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13479_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_async_flips@invalid-async-=
flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other=
 tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_bw@linear-tiling-1-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +188 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +33 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-2/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to=
-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-c=
hange-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13479/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5428">Intel XE#5428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/sha=
rd-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4294">Intel XE#4294</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6=
/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4164">Intel XE#4164</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@kms_feature_discovery@dp-mst.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-b=
mg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@k=
ms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms@edp-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/s=
hard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883=
</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-=
lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-2/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@kms_tiled_display@basic-test-p=
attern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-7/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-7/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_eudebug@basic-close.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadat=
a-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-5/igt@xe_eudebug@discovery-race-vmbind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4518">Intel XE#4518</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-2/igt@xe_evict@evict-beng-small-multi-=
vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13479/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-=
batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-3/igt@xe_exec_system_allocator@process=
-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@xe_exec_system_allocator@threads=
-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_exec_system_allocator@threa=
ds-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +176 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-6/igt@xe_exec_sys=
tem_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_fault_injection@probe-fail-=
guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5531">Intel XE#5531</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-4/igt@xe_mmap@pci-membarrier-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8460/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-436/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8460/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-466=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8460/shard-dg2-466/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-=
dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8460/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8460/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8460/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-43=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8460/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-432/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_846=
0/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8460/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-434/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8460/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8460/shard-dg2-433/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8460/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13479/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shar=
d-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13479/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13479/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2=
-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
479/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13479/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13479/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shar=
d-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13479/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_oa@disabled-read-error.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979=
">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-435/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-434/i=
gt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-5/igt@xe_pxp@pxp-termination-key-updat=
e-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-433/igt@xe_pxp@pxp-termination-key-upd=
ate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-434/igt@xe_query@multigpu-query-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-lnl-7/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_render_copy@render-stress-2=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_async_flips=
@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2560x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard=
-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13479/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5354">Intel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13479/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-tog=
gle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633=
">Intel XE#4633</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13479/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13479/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel=
 XE#1340</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13479/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13479/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13479/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-435/igt@kms_flip@flip-vs-rmfb-interruptible.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-463/igt@kms_flip@flip-vs-rmfb-=
interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/sha=
rd-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13479/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-=
lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13479/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_134=
79/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_exec_b=
asic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</a> =
+5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">=
Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13479/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind-err.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3876">Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13479/shard-dg2-432/igt@xe_exec_threads@threads-hang-reb=
ind-err.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-466/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13479/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13479/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yt=
ile-downscaling.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-8/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13479/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13479/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13479/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-466/igt@xe_exec_system_allocator@once-large-mmap-file-=
nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_exec_system_allocato=
r@once-large-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">In=
tel XE#4501</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5103">Intel XE#5103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13479/shard-dg2-435/igt@xe_oa@mmio-triggered-reports-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5103">Intel XE#5103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-464/igt@xe_oa@oa-unit-exclusive=
-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8460/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel X=
E#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13479/shard-dg2-436/igt@xe_oa@syncs-userptr-w=
ait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8460 -&gt; IGTPW_13479</li>
<li>Linux: xe-3418-3309055b0f5cf28f0dd124be1f8f08507a35aec1 -&gt; xe-3420-6=
9e98a7d66784ff8a833b2b7ef4290ae3f083c5f</li>
</ul>
<p>IGTPW_13479: 2847682743bc3ca3258f6f65399e361f1d49ff67 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8460: 8460<br />
  xe-3418-3309055b0f5cf28f0dd124be1f8f08507a35aec1: 3309055b0f5cf28f0dd124b=
e1f8f08507a35aec1<br />
  xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f: 69e98a7d66784ff8a833b2b=
7ef4290ae3f083c5f</p>

</body>
</html>

--===============7322050566830394881==--
