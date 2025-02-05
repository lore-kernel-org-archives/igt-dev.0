Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A29BC02194
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 22:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE57610E211;
	Wed,  5 Feb 2025 22:21:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095E710E211;
 Wed,  5 Feb 2025 22:21:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6355680733163246974=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fpmu=3A_Ad?=
 =?utf-8?q?d_PMU_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Feb 2025 22:21:06 -0000
Message-ID: <173879406601.1669789.3187590522659359289@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205182214.1650169-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250205182214.1650169-1-vinay.belgaumkar@intel.com>
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

--===============6355680733163246974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Add PMU tests
URL   : https://patchwork.freedesktop.org/series/144375/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8224_full -> XEIGTPW_12549_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12549_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12549_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12549_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@xe_module_load@many-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_module_load@many-reload.html

  
New tests
---------

  New tests have been introduced between XEIGT_8224_full and XEIGTPW_12549_full:

### New IGT tests (1) ###

  * igt@xe_pmu@gt-c6-idle:
    - Statuses : 3 pass(s)
    - Exec time: [2.00, 4.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12549_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@fbdev@pan.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][4] -> [SKIP][5] ([Intel XE#2134]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@fbdev@read.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@fbdev@read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2233])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#623])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1466])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#911]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3768])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3768])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3768])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3279])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +13 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1512]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#367]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +174 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2907])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#3432])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2669]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +17 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +14 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1727] / [Intel XE#3113])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#3124] / [Intel XE#4010])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2652] / [Intel XE#787]) +13 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2724]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#314])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1152]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1152]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2325]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#306])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#373]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#3278]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][54] ([Intel XE#1178]) +4 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#307]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#307]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2390]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2341])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#308])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2321]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1424]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#4208] / [i915#2575]) +76 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#309]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2291]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2291]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#323])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#323])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2286])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4210])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#3009])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@kms_dp_aux_dev.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2244]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2244]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#4164])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#776])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2373])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#703])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2373])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#301] / [Intel XE#3321])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][86] ([Intel XE#301]) +8 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][87] ([Intel XE#3321]) +4 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#301]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1421]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#3098])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#2316]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2316]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4208] / [i915#2575]) +48 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][98] -> [FAIL][99] ([Intel XE#3321]) +3 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][100] -> [INCOMPLETE][101] ([Intel XE#2049]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][102] -> [FAIL][103] ([Intel XE#2882]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][105] -> [DMESG-WARN][106] ([Intel XE#1033]) +21 other tests dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1401]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2293]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#352]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2311]) +25 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#651]) +14 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4141]) +12 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2351] / [Intel XE#4208]) +14 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#651]) +18 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#653]) +25 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2312]) +14 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2313]) +29 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2352])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1469])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#656]) +43 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2502])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#605])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][126] ([Intel XE#1033]) +18 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#1503])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1503])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2934])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2934])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4090])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2925])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4090])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#599])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2393])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][136] ([Intel XE#4172]) +10 other tests dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2763]) +8 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#2763]) +31 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2763]) +19 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#870])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][142] ([Intel XE#718])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#3309])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2505])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][145] ([Intel XE#2029])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1439] / [Intel XE#836])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1439] / [Intel XE#3141])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [PASS][148] -> [DMESG-WARN][149] ([Intel XE#1033] / [Intel XE#2042])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_pm_rpm@drm-resources-equal.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][150] ([Intel XE#1033] / [Intel XE#2042])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1489]) +8 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#2893]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1489]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1122]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2387])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#4208]) +131 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1406]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2414])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2939]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#3414]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2413])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#1435]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1435])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][168] -> [DMESG-WARN][169] ([Intel XE#4212]) +2 other tests dmesg-warn
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#2159]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [FAIL][172] ([Intel XE#1522]) +7 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#455]) +22 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#1499]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1499]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#756]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#756]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1091] / [Intel XE#2849])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1126]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#2905]) +9 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@exec-queue-placements:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2905]) +9 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_eudebug@exec-queue-placements.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#688]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [PASS][184] -> [SKIP][185] ([Intel XE#4208]) +163 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#2322]) +8 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#1392]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#288]) +19 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#2360])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2905]) +7 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][191] -> [DMESG-WARN][192] ([Intel XE#4172]) +36 other tests dmesg-warn
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2229])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#4045])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#378])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220]) -> ([PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [SKIP][244], [PASS][245], [PASS][246]) ([Intel XE#378])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271]) -> ([PASS][272], [PASS][273], [SKIP][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297]) ([Intel XE#2457])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#2838] / [Intel XE#979])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][300] ([Intel XE#977])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#2245])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#2236])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#979])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][304] ([Intel XE#1173])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][305] ([Intel XE#2427])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][306] ([Intel XE#1061])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][307] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][308] ([Intel XE#2284])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][309] ([Intel XE#1948])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][310] ([Intel XE#2284]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][311] ([Intel XE#1616] / [Intel XE#4172])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][312] ([Intel XE#2284] / [Intel XE#366])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][313] -> [DMESG-WARN][314] ([Intel XE#4172] / [Intel XE#569]) +1 other test dmesg-warn
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@xe_pm@s3-exec-after.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][315] ([Intel XE#584])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][316] -> [DMESG-WARN][317] ([Intel XE#1033] / [Intel XE#569])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][318] ([Intel XE#1358])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          NOTRUN -> [ABORT][319] ([Intel XE#1358] / [Intel XE#1607])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          NOTRUN -> [ABORT][320] ([Intel XE#1358] / [Intel XE#1607])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][321] ([Intel XE#944]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][322] ([Intel XE#944]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][323] ([Intel XE#944]) +6 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][324] ([Intel XE#4130])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_sriov_auto_provisioning@fair-allocation.html
    - shard-bmg:          NOTRUN -> [SKIP][325] ([Intel XE#4130])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][326] -> [PASS][327] +3 other tests pass
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@core_getversion@all-cards.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@core_getversion@all-cards.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2134]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@fbdev@write.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#4208] / [i915#2575]) -> [PASS][331] +89 other tests pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][333] +12 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][334] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][336] ([Intel XE#1033]) -> [PASS][337] +26 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][338] ([Intel XE#2291]) -> [PASS][339] +7 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][340] ([Intel XE#2316]) -> [PASS][341] +6 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - shard-bmg:          [FAIL][342] ([Intel XE#3321]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][344] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][346] -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][348] ([Intel XE#2571]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [FAIL][350] ([Intel XE#3924]) -> [PASS][351] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-render.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][352] ([Intel XE#1435]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#4208]) -> [PASS][355] +184 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-bmg:          [INCOMPLETE][356] -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [DMESG-WARN][358] ([Intel XE#4172]) -> [PASS][359] +44 other tests pass
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [INCOMPLETE][360] ([Intel XE#1358] / [Intel XE#569]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
    - shard-dg2-set2:     [DMESG-WARN][362] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][364] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][365] +2 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#873]) -> [SKIP][367] ([Intel XE#4208] / [i915#2575])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][369] ([Intel XE#316]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#4208]) -> [SKIP][371] ([Intel XE#316]) +3 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#316]) -> [SKIP][373] ([Intel XE#2351] / [Intel XE#4208])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#1124]) -> [SKIP][375] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][377] ([Intel XE#607])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][379] ([Intel XE#1124]) +4 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#4208]) -> [SKIP][381] ([Intel XE#607])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#4208]) -> [SKIP][383] ([Intel XE#610])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#4208]) -> [SKIP][385] ([Intel XE#1124]) +6 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1124]) -> [SKIP][387] ([Intel XE#4208]) +6 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2191]) -> [SKIP][389] ([Intel XE#4208] / [i915#2575])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#367]) -> [SKIP][391] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#4208] / [i915#2575]) -> [SKIP][393] ([Intel XE#367]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#4208]) -> [SKIP][395] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2907]) -> [SKIP][397] ([Intel XE#4208]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][399] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][401] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#3442]) -> [SKIP][403] ([Intel XE#4208])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#4208]) -> [SKIP][405] ([Intel XE#2907])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][406] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [SKIP][407] ([Intel XE#4208])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][409] ([Intel XE#4208]) +11 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][411] ([Intel XE#314])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#306]) -> [SKIP][413] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#4208] / [i915#2575]) -> [SKIP][415] ([Intel XE#306])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#373]) -> [SKIP][417] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#4208] / [i915#2575]) -> [SKIP][419] ([Intel XE#373]) +12 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][420] ([Intel XE#2341]) -> [FAIL][421] ([Intel XE#1178])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@kms_content_protection@atomic.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#4208] / [i915#2575]) -> [FAIL][423] ([Intel XE#1178])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_content_protection@atomic.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#307]) -> [SKIP][425] ([Intel XE#4208] / [i915#2575])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][426] ([Intel XE#1178]) -> [SKIP][427] ([Intel XE#2341])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/igt@kms_content_protection@legacy.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][428] ([Intel XE#1188]) -> [SKIP][429] ([Intel XE#4208] / [i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_content_protection@uevent.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#4208] / [i915#2575]) -> [SKIP][431] ([Intel XE#308]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#308]) -> [SKIP][433] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#4208] / [i915#2575]) -> [DMESG-WARN][435] ([Intel XE#1033]) +1 other test dmesg-warn
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#4208] / [i915#2575]) -> [SKIP][437] ([Intel XE#323])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][438] ([Intel XE#1033]) -> [SKIP][439] ([Intel XE#4208] / [i915#2575])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][440] ([Intel XE#2291]) -> [DMESG-WARN][441] ([Intel XE#877])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][443] ([Intel XE#455])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#4208] / [i915#2575]) -> [SKIP][445] ([Intel XE#307]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#455]) -> [SKIP][447] ([Intel XE#2351] / [Intel XE#4208])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#4208]) -> [SKIP][449] ([Intel XE#776])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#4208] / [i915#2575]) -> [SKIP][451] ([Intel XE#703])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][452] ([Intel XE#2316]) -> [FAIL][453] ([Intel XE#3321])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#4208] / [i915#2575]) -> [FAIL][455] ([Intel XE#3098])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#4208] / [i915#2575]) -> [FAIL][457] ([Intel XE#301])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][458] ([Intel XE#2955]) -> [SKIP][459] ([Intel XE#4208] / [i915#2575])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#4208] / [i915#2575]) -> [DMESG-WARN][461] ([Intel XE#2955])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#455]) -> [SKIP][463] ([Intel XE#4208]) +1 other test skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#4208]) -> [SKIP][465] ([Intel XE#455]) +5 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][466] ([Intel XE#2311]) -> [SKIP][467] ([Intel XE#2312]) +9 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][468] ([Intel XE#2312]) -> [SKIP][469] ([Intel XE#2311]) +16 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#651]) -> [SKIP][471] ([Intel XE#4208]) +15 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][472] ([Intel XE#4141]) -> [SKIP][473] ([Intel XE#2312]) +4 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][474] ([Intel XE#2312]) -> [SKIP][475] ([Intel XE#4141]) +6 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][477] ([Intel XE#651]) +12 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#4208]) -> [SKIP][479] ([Intel XE#651]) +19 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#651]) -> [SKIP][481] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][483] ([Intel XE#658])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#653]) -> [SKIP][485] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#653]) -> [SKIP][487] ([Intel XE#4208]) +24 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][488] ([Intel XE#2313]) -> [SKIP][489] ([Intel XE#2312]) +10 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#4208]) -> [SKIP][491] ([Intel XE#653]) +22 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][492] ([Intel XE#2312]) -> [SKIP][493] ([Intel XE#2313]) +11 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][495] ([Intel XE#653]) +8 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#455]) -> [SKIP][497] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_hdr@brightness-with-hdr.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#4208]) -> [SKIP][499] ([Intel XE#346]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#4208]) -> [SKIP][501] ([Intel XE#2925])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#2927]) -> [SKIP][503] ([Intel XE#4208])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][504] ([Intel XE#616]) -> [SKIP][505] ([Intel XE#4208] / [i915#2575])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_plane_cursor@primary.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][507] ([Intel XE#4208] / [i915#2575])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#4208] / [i915#2575]) -> [SKIP][509] ([Intel XE#2763] / [Intel XE#455])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#2938]) -> [SKIP][511] ([Intel XE#4208])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][513] ([Intel XE#1122])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#4208]) -> [SKIP][515] ([Intel XE#908])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#1489]) -> [SKIP][517] ([Intel XE#4208]) +5 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#4208]) -> [SKIP][519] ([Intel XE#1489]) +7 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][521] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][523] ([Intel XE#4208]) +8 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#4208]) -> [SKIP][525] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][527] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#4208] / [i915#2575]) -> [SKIP][529] ([Intel XE#3414])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#4208] / [i915#2575]) -> [SKIP][531] ([Intel XE#1127])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#1127]) -> [SKIP][533] ([Intel XE#4208] / [i915#2575])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#3414]) -> [SKIP][535] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#1500]) -> [SKIP][537] ([Intel XE#362])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#330]) -> [SKIP][539] ([Intel XE#4208] / [i915#2575])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][540] ([Intel XE#771] / [Intel XE#899]) -> [SKIP][541] ([Intel XE#4208] / [i915#2575])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#4208] / [i915#2575]) -> [SKIP][543] ([Intel XE#2168])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_vrr@cmrr.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#4208] / [i915#2575]) -> [SKIP][545] ([Intel XE#455]) +8 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_vrr@flip-dpms.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#756]) -> [SKIP][547] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#4208] / [i915#2575]) -> [SKIP][549] ([Intel XE#756])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#4208]) -> [SKIP][551] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][553] ([Intel XE#4208])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#1123]) -> [SKIP][555] ([Intel XE#4208])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#4208]) -> [SKIP][557] ([Intel XE#1126])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#3889]) -> [SKIP][559] ([Intel XE#4208])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#4208]) -> [SKIP][561] ([Intel XE#2905]) +8 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#2905]) -> [SKIP][563] ([Intel XE#4208]) +7 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#4208]) -> [DMESG-WARN][565] ([Intel XE#1033] / [Intel XE#1473])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_evict@evict-beng-small-multi-vm.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#288]) -> [SKIP][567] ([Intel XE#4208]) +23 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#4208]) -> [SKIP][569] ([Intel XE#288]) +22 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#4208]) -> [SKIP][571] ([Intel XE#2360]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][572] ([Intel XE#1033]) -> [SKIP][573] ([Intel XE#4208])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-463/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#255]) -> [SKIP][575] ([Intel XE#4208])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][577] ([Intel XE#1192])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#4208]) -> [SKIP][579] ([Intel XE#2541] / [Intel XE#3573]) +7 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][581] ([Intel XE#4208]) +4 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#977]) -> [SKIP][583] ([Intel XE#4208])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#4208]) -> [SKIP][585] ([Intel XE#979])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][587] ([Intel XE#1173])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_peer2peer@read.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][589] ([Intel XE#4208])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@xe_pm@d3cold-basic.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#4208]) -> [SKIP][591] ([Intel XE#2284] / [Intel XE#366])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [DMESG-WARN][592] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][593] ([Intel XE#4208])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-434/igt@xe_pm@s3-basic.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [ABORT][594] ([Intel XE#1358]) -> [SKIP][595] ([Intel XE#4208])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@xe_pm@s4-basic-exec.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#4208]) -> [ABORT][597] ([Intel XE#1358])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [ABORT][598] ([Intel XE#1033] / [Intel XE#1358]) -> [ABORT][599] ([Intel XE#1358])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-466/igt@xe_pm@s4-mocs.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][600] ([Intel XE#1033] / [Intel XE#1358]) -> [SKIP][601] ([Intel XE#4208])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-436/igt@xe_pm@s4-vm-bind-prefetch.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#4208]) -> [SKIP][603] ([Intel XE#944]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#944]) -> [SKIP][605] ([Intel XE#4208]) +1 other test skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#4208]) -> [SKIP][607] ([Intel XE#3342])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8224 -> IGTPW_12549
  * Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 -> xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe

  IGTPW_12549: 1068ec141c59baaf9561b048d289723d869f0656 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: a7df3eccb725a8d72f8f3ed87ee7ad9419b17380
  xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe: 5592bc56322b20198056d88dd12fc86ebb0dfcbe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/index.html

--===============6355680733163246974==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Add PMU tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144375/">https://patchwork.freedesktop.org/series/144375/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12549/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12549/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8224_full -&gt; XEIGTPW_12549_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12549_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12549_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
549_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@many-reload:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg=
2-464/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8224_full and XEIGTPW_12549=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_pmu@gt-c6-idle:<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.00, 4.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12549_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@fbdev@pan.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2=
134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@fbdev@read.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_async_flips@invalid-async-=
flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_atomic_transition@plane-all-=
modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12549/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_bw@linear-tiling-2-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-til=
ed-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152=
">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_chamelium_color@ctm-negati=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-enable=
-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_content_protection@dp-mst-=
lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-12=
8x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549=
/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Inte=
l XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4164">Intel XE#4164</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-8/igt@kms_feature_discovery@display-2x.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shar=
d-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12549/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-=
interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/sh=
ard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
49/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2549/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">In=
tel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-=
hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interrup=
tible@b-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg=
-4/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-64bpp-4tile-downscaling.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +21 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp=
-linear-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32b=
pp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_force_connector_basic@prune-=
stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +43 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1033">Intel XE#1033</a>) +18 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_joiner@switch-modeset-ultr=
a-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/59=
9">Intel XE#599</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
93">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_plane_multiple@tiling-none.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4172">Intel XE#4172</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +31 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">In=
tel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shar=
d-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042"=
>Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_pm_rpm@system-suspend-mode=
set.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@kms_psr@pr-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel =
XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing=
@pipe-a-hdmi-a-6-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_setmode@invalid-clon=
e-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Int=
el XE#1522</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@xe_eudebug@basic-connect.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@exec-queue-placements:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_eudebug@exec-queue-placements=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +163 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_exec_fault_mode@many-bindex=
ecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint=
-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe=
_engine_class_render0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-w=
ritesip-nodebug@drm_xe_engine_class_render0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172=
</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-objec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8224/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8224/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8224/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8224/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8224/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8224/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-ln=
l-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard=
-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
224/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8224/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8224/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/s=
hard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12549/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12549/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shar=
d-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2549/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-lnl-4/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12549/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8224/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8224/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8224/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
224/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8224/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8224/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module_load@load.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/s=
hard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12549/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12549/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12549/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2549/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12549/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Int=
el XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">I=
ntel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">=
Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@xe_pm@s2idle-d3hot-basic-exec.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-8/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@x=
e_pm@s3-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other =
test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-d=
g2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel X=
E#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_pm@s4-basic.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Inte=
l XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@xe_pm@s4-exec-after.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">I=
ntel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1607">Intel XE#1607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-7/igt@xe_pm@s4-exec-after.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">I=
ntel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_query@multigpu-query-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-8/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-lnl-1/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@core_getversion@all-cards.html">FAIL</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2=
-434/igt@core_getversion@all-cards.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@fbdev@write.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2=
-435/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_atomic@plane-invalid-p=
arams-fence.html">PASS</a> +89 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_big_fb@4-til=
ed-max-hw-stride-64bpp-rotate-0.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-1/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2560x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-r=
c-ccs-cc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_ccs@crc-prima=
ry-rotation-180-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +26 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-5/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +7 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
21">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a=
3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-mod=
eset.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@single-buffer-flip-vs-dpms=
-off-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12549/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-render.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel X=
E#3924</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12549/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12549/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.ht=
ml">PASS</a> +184 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-pref=
etch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue=
-userptr-rebind-prefetch.html">INCOMPLETE</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_exec_fault_mod=
e@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Int=
el XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12549/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html">PASS</a> +44=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel =
XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12549/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</=
a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel X=
E#4172</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12549/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">In=
tel XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12549/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">I=
ntel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"=
>Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">=
Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12549/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_big_fb@y-tiled=
-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflo=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_big_fb@yf-tile=
d-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_big_fb=
@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_bw@connected-linear-t=
iling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12549/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_bw@linear-tiling-=
3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12549/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
07">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@ccs-on-another-=
bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3442">Intel XE#3442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_ccs@random-ccs-data-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_cdclk@mode-transition-=
all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE=
#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12549/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_chamelium_color@ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12549/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">I=
ntel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12549/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_content_protection@atomic.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">=
Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12549/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12549/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_cursor_crc@cursor-ons=
creen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12549/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-curso=
r-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms_curso=
r_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_cursor_legacy@=
cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggl=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_display_modes@m=
st-extended-mode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12549/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2549/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_feature_discovery@display-3=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12549/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">In=
tel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_flip@2x-flip-vs-=
wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@flip-vs-e=
xpired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel=
 XE#2955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12549/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_flip@flip-vs-suspend-=
interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64b=
pp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_flip_scal=
ed_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-=
ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-434/igt@kms=
_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rt=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_tracking=
@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_frontbuffer_=
tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-bmg-2/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt=
@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">In=
tel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2549/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12549/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12549/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
25">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel =
XE#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12549/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_plane_cursor@primary.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-dg2-464/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-=
with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25=
-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/i=
gt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938=
">Intel XE#2938</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12549/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12549/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/s=
hard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-=
overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@kms_psr2_sf@=
fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#14=
89</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#285=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"=
>Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12549/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#9=
29</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12549/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE=
#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-436/igt@kms_rotation_crc@=
primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">=
Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12549/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel =
XE#330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12549/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">In=
tel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_universal_plane@cursor-fb-lea=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12549/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb21010=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-463/igt@kms_writeback@writeback-pi=
xel-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280=
">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
80">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_compute_preempt@compute=
-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">=
Intel XE#1123</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12549/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12549/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">=
Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3889">Intel XE#3889</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-dela=
y-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12549/shard-dg2-436/igt@xe_eudebug_online@interrupt-other=
-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"=
>Intel XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12549/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-dg2-463/igt@xe_evict@evict-beng-small-multi-vm.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12549/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-=
imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12549/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-r=
ebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12549/shard-dg2-466/igt@xe_exec_mix_modes@exec-sim=
ple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-463/igt@xe_exec_threads@threads-mixed-fd-userptr-inval=
idate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_exec_threads@thre=
ads-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/=
shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541=
">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE=
#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12549/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12549/=
shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Inte=
l XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12549/shard-dg2-464/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12549/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#228=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"=
>Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-434/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">=
Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12549/shard-dg2-464/igt@xe_pm@s3-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1254=
9/shard-dg2-464/igt@xe_pm@s4-basic-exec.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2549/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-466/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel X=
E#1358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12549/shard-dg2-435/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-436/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
358">Intel XE#1358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12549/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12549/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Int=
el XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8224/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12549/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Inte=
l XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8224 -&gt; IGTPW_12549</li>
<li>Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 -&gt; xe-2605-5=
592bc56322b20198056d88dd12fc86ebb0dfcbe</li>
</ul>
<p>IGTPW_12549: 1068ec141c59baaf9561b048d289723d869f0656 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: a7df3eccb725a8d72f8f3ed=
87ee7ad9419b17380<br />
  xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe: 5592bc56322b20198056d88=
dd12fc86ebb0dfcbe</p>

</body>
</html>

--===============6355680733163246974==--
