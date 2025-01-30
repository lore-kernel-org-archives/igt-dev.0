Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22828C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 05:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93A110E13B;
	Thu, 30 Jan 2025 05:15:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE29C10E13B;
 Thu, 30 Jan 2025 05:15:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8469103485833210670=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fpm=5Frpm?=
 =?utf-8?q?=3A_Restrict_cursor_tests_to_I915_driver_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jan 2025 05:15:03 -0000
Message-ID: <173821410381.2729638.1943927106827541456@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129174153.3654881-1-jeevan.b@intel.com>
In-Reply-To: <20250129174153.3654881-1-jeevan.b@intel.com>
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

--===============8469103485833210670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_rpm: Restrict cursor tests to I915 driver (rev2)
URL   : https://patchwork.freedesktop.org/series/144000/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8214_full -> XEIGTPW_12514_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12514_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12514_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12514_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +18 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12514_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2423]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@core_getstats.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] ([Intel XE#3440])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@core_getversion@all-cards.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@core_getversion@all-cards.html
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3249])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-4/igt@core_getversion@all-cards.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          NOTRUN -> [ABORT][11] ([Intel XE#3914])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2134]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@fbdev@info.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#2134]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@fbdev@read.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#873])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2136]) +39 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2136]) +17 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1512])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#3433]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][35] ([Intel XE#1033] / [Intel XE#2625])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#3432])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +181 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2907])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#314]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2252]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#1178]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2423] / [i915#2575]) +39 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1178]) +3 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3278])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2320]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1424]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][54] ([Intel XE#4172]) +4 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#323])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2291]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#309])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1340])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2372])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#3321]) +5 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1421]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#886]) +4 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#2423] / [i915#2575]) +84 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_flip@busy-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][71] -> [DMESG-WARN][72] ([Intel XE#1033]) +14 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#301]) +6 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4172]) +33 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2423]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#455]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397] / [Intel XE#1745])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1397])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2293] / [Intel XE#2380])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#651]) +18 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#651]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4141]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#2136]) +22 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#658])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2311]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2136]) +12 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2312])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#656]) +12 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#653]) +13 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2313]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1503])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2927])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][100] ([Intel XE#1033]) +5 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2763]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2763]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2763]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#2446]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#2446]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2893])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1489]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2234])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2414])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3414])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#2423]) +76 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_sequence@get-idle.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_sequence@get-idle.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1499])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#756])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1123])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_create@create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1130]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_create@create-massive-size.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#3889])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@discovery-race:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2905]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@xe_eudebug@discovery-race.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2905]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2905]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#688]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1130]) +62 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1392]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1392])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#1392]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2322]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_compute_mode@non-blocking:
    - shard-bmg:          [PASS][136] -> [SKIP][137] ([Intel XE#1130]) +177 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_exec_compute_mode@non-blocking.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_exec_compute_mode@non-blocking.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#288]) +15 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2360])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#584]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][141] -> [SKIP][142] ([Intel XE#1192])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#1999]) +2 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#4045])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169]) -> ([PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [SKIP][195]) ([Intel XE#378])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][196] -> [FAIL][197] ([Intel XE#3546])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@xe_module_load@many-reload.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][198] ([Intel XE#3546])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_module_load@many-reload.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2427])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-lnl:          [PASS][201] -> [DMESG-WARN][202] ([Intel XE#1616])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-userptr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][203] -> [ABORT][204] ([Intel XE#1358] / [Intel XE#1794])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][205] -> [DMESG-WARN][206] ([Intel XE#4172] / [Intel XE#569]) +1 other test dmesg-warn
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@xe_pm@s3-exec-after.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][207] -> [DMESG-WARN][208] ([Intel XE#1033] / [Intel XE#569])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][209] ([Intel XE#1358])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][210] -> [ABORT][211] ([Intel XE#1358] / [Intel XE#1607])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][212] -> [ABORT][213] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][214] -> [DMESG-WARN][215] ([Intel XE#3088] / [Intel XE#4172]) +1 other test dmesg-warn
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#944])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#944])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#944])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#3342])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][220] -> [SKIP][221] ([Intel XE#1130]) +144 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][222] ([Intel XE#3453]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][224] ([Intel XE#3249]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2134]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@fbdev@pan.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@fbdev@pan.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][228] ([Intel XE#2134]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@fbdev@write.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][230] ([Intel XE#3908]) -> [PASS][231] +3 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][232] ([Intel XE#2136]) -> [PASS][233] +22 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][234] -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2423] / [i915#2575]) -> [PASS][237] +104 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][238] ([Intel XE#3321]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][240] ([Intel XE#2423]) -> [PASS][241] +75 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][242] ([Intel XE#2316]) -> [PASS][243] +1 other test pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][244] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][247] +11 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2136]) -> [PASS][249] +26 other tests pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [DMESG-WARN][250] ([Intel XE#1033]) -> [PASS][251] +11 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][252] ([Intel XE#1503]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][254] ([Intel XE#2571]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-bmg:          [SKIP][256] ([Intel XE#2446]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@legacy-planes.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2446]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][260] ([Intel XE#1435]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [DMESG-WARN][262] ([Intel XE#4172]) -> [PASS][263] +3 other tests pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_vblank@wait-busy-hang.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1130]) -> [PASS][265] +162 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][266] ([Intel XE#1130]) -> [PASS][267] +191 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1392]) -> [PASS][269] +2 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][270] ([Intel XE#1192]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][272] ([Intel XE#3546]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_module_load@reload.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][274] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][276] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][277] +1 other test pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][278] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][280] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][282] ([Intel XE#2233]) -> [SKIP][283] ([Intel XE#2423])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#623]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#316]) -> [SKIP][287] ([Intel XE#2136] / [Intel XE#2351])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#316]) -> [SKIP][289] ([Intel XE#2136]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][291] ([Intel XE#316])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][292] ([Intel XE#2136]) -> [SKIP][293] ([Intel XE#2327]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][294] ([Intel XE#2327]) -> [SKIP][295] ([Intel XE#2136]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [SKIP][296] ([Intel XE#2136]) -> [DMESG-WARN][297] ([Intel XE#4172]) +1 other test dmesg-warn
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2136]) -> [SKIP][299] ([Intel XE#1124]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][300] ([Intel XE#2136]) -> [SKIP][301] ([Intel XE#1124]) +8 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1124]) -> [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1124]) -> [SKIP][305] ([Intel XE#2136]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][307] ([Intel XE#619])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][308] ([Intel XE#2136]) -> [SKIP][309] ([Intel XE#607]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#610]) -> [SKIP][311] ([Intel XE#2136])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][312] ([Intel XE#1124]) -> [SKIP][313] ([Intel XE#2136]) +7 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2191]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][316] ([Intel XE#2423]) -> [SKIP][317] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2423] / [i915#2575]) -> [SKIP][319] ([Intel XE#2191])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][320] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][321] ([Intel XE#2423]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#367]) -> [SKIP][323] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][324] ([Intel XE#367]) -> [SKIP][325] ([Intel XE#2423]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2423] / [i915#2575]) -> [SKIP][327] ([Intel XE#367]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][328] ([Intel XE#2423]) -> [SKIP][329] ([Intel XE#367]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][330] ([Intel XE#2887]) -> [SKIP][331] ([Intel XE#2136]) +14 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][333] ([Intel XE#2136]) +10 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2136]) -> [SKIP][335] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2907]) -> [SKIP][337] ([Intel XE#2136])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][338] ([Intel XE#2136]) -> [SKIP][339] ([Intel XE#2652] / [Intel XE#787])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#2887]) +13 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#3442]) -> [SKIP][343] ([Intel XE#2136]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][344] ([Intel XE#2136]) -> [SKIP][345] ([Intel XE#3432]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2136]) -> [ABORT][347] ([Intel XE#1033] / [Intel XE#2625])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][348] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][349] ([Intel XE#2136])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][350] ([Intel XE#3432]) -> [SKIP][351] ([Intel XE#2136])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2136]) -> [SKIP][353] ([Intel XE#2907])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][355] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][356] ([Intel XE#2692] / [Intel XE#4010]) -> [SKIP][357] ([Intel XE#2136])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][358] ([Intel XE#2325]) -> [SKIP][359] ([Intel XE#2423]) +3 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][360] ([Intel XE#2423]) -> [SKIP][361] ([Intel XE#2325])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#306]) -> [SKIP][363] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2423] / [i915#2575]) -> [SKIP][365] ([Intel XE#306]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][366] ([Intel XE#2423]) -> [SKIP][367] ([Intel XE#2252]) +11 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2423] / [i915#2575]) -> [SKIP][369] ([Intel XE#373]) +6 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][370] ([Intel XE#2252]) -> [SKIP][371] ([Intel XE#2423]) +9 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#373]) -> [SKIP][373] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][374] ([Intel XE#2423]) -> [FAIL][375] ([Intel XE#1178]) +1 other test fail
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_content_protection@atomic.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][376] ([Intel XE#2341]) -> [SKIP][377] ([Intel XE#2423]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#307]) -> [SKIP][379] ([Intel XE#2423] / [i915#2575])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][380] ([Intel XE#2390]) -> [SKIP][381] ([Intel XE#2423])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [SKIP][383] ([Intel XE#307])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][384] ([Intel XE#2423]) -> [SKIP][385] ([Intel XE#2390]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][386] ([Intel XE#1178]) -> [SKIP][387] ([Intel XE#2341])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_content_protection@legacy.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2423] / [i915#2575]) -> [FAIL][389] ([Intel XE#1178]) +1 other test fail
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_content_protection@legacy.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][390] ([Intel XE#1178]) -> [SKIP][391] ([Intel XE#2423] / [i915#2575])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][392] ([Intel XE#2423]) -> [SKIP][393] ([Intel XE#2341]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_content_protection@mei-interface.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][394] ([Intel XE#2423]) -> [SKIP][395] ([Intel XE#2320]) +7 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][396] ([Intel XE#2320]) -> [SKIP][397] ([Intel XE#2423]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-random-64x21.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][398] ([Intel XE#2423]) -> [SKIP][399] ([Intel XE#2321])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][400] ([Intel XE#2321]) -> [SKIP][401] ([Intel XE#2423]) +4 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#308]) -> [SKIP][403] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][404] ([Intel XE#4172]) -> [SKIP][405] ([Intel XE#2423]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
    - shard-dg2-set2:     [DMESG-WARN][406] ([Intel XE#1033]) -> [SKIP][407] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][408] ([Intel XE#2423]) -> [SKIP][409] ([Intel XE#2286]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#323]) -> [SKIP][411] ([Intel XE#2423] / [i915#2575])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][412] ([Intel XE#2291]) -> [SKIP][413] ([Intel XE#2423])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][414] ([Intel XE#2423]) -> [DMESG-WARN][415] ([Intel XE#877])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][416] ([Intel XE#2291]) -> [DMESG-WARN][417] ([Intel XE#4172])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [INCOMPLETE][418] ([Intel XE#3226]) -> [SKIP][419] ([Intel XE#2423])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][420] ([Intel XE#2286]) -> [SKIP][421] ([Intel XE#2423])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2423] / [i915#2575]) -> [SKIP][423] ([Intel XE#323])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][424] ([Intel XE#2425]) -> [SKIP][425] ([Intel XE#2423])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][426] ([Intel XE#2244]) -> [SKIP][427] ([Intel XE#2136]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][428] ([Intel XE#2136]) -> [SKIP][429] ([Intel XE#2244])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][430] ([Intel XE#2136]) -> [SKIP][431] ([Intel XE#4156])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2136]) -> [SKIP][433] ([Intel XE#776])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2423] / [i915#2575]) -> [SKIP][435] ([Intel XE#1138])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][436] ([Intel XE#2374]) -> [SKIP][437] ([Intel XE#2423])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_feature_discovery@psr1.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#1135]) -> [SKIP][439] ([Intel XE#2423] / [i915#2575])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][440] ([Intel XE#2423]) -> [SKIP][441] ([Intel XE#2316])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2-set2:     [INCOMPLETE][442] ([Intel XE#2049]) -> [SKIP][443] ([Intel XE#2423] / [i915#2575])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_flip@flip-vs-panning.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][444] ([Intel XE#2136]) -> [SKIP][445] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#455]) -> [SKIP][447] ([Intel XE#2136]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][449] ([Intel XE#455]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][450] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][451] ([Intel XE#2136]) +3 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][452] ([Intel XE#2311]) -> [SKIP][453] ([Intel XE#2136]) +25 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#651]) +15 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][456] ([Intel XE#2312]) -> [SKIP][457] ([Intel XE#2311]) +5 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][458] ([Intel XE#2312]) -> [SKIP][459] ([Intel XE#2136]) +5 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#651]) -> [SKIP][461] ([Intel XE#2136]) +15 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][462] ([Intel XE#2136]) -> [SKIP][463] ([Intel XE#2311]) +28 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#651]) -> [SKIP][465] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][467] ([Intel XE#651]) +9 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][468] ([Intel XE#4141]) -> [SKIP][469] ([Intel XE#2136]) +12 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2136]) -> [DMESG-WARN][471] ([Intel XE#1033])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][472] ([Intel XE#4141]) -> [SKIP][473] ([Intel XE#2312]) +4 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][474] ([Intel XE#2312]) -> [SKIP][475] ([Intel XE#4141]) +5 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][476] ([Intel XE#2311]) -> [SKIP][477] ([Intel XE#2312]) +8 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][478] ([Intel XE#2313]) -> [SKIP][479] ([Intel XE#2312]) +5 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#2136]) -> [SKIP][481] ([Intel XE#653]) +17 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][482] ([Intel XE#2136]) -> [SKIP][483] ([Intel XE#2312]) +3 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#653]) -> [SKIP][485] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][486] ([Intel XE#2312]) -> [SKIP][487] ([Intel XE#2313]) +7 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][488] ([Intel XE#2313]) -> [SKIP][489] ([Intel XE#2136]) +26 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][491] ([Intel XE#658])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#4141]) +10 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#2136]) -> [SKIP][495] ([Intel XE#455]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#1158]) -> [SKIP][497] ([Intel XE#2136])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#653]) -> [SKIP][499] ([Intel XE#2136]) +18 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][501] ([Intel XE#653]) +9 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][502] ([Intel XE#2136]) -> [SKIP][503] ([Intel XE#2313]) +30 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#2423] / [i915#2575]) -> [SKIP][505] ([Intel XE#605])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][506] ([Intel XE#3544]) -> [SKIP][507] ([Intel XE#2423])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#2423] / [i915#2575]) -> [SKIP][509] ([Intel XE#455]) +11 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][510] ([Intel XE#2136]) -> [SKIP][511] ([Intel XE#346])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][512] ([Intel XE#346]) -> [SKIP][513] ([Intel XE#2136])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][514] ([Intel XE#2423]) -> [SKIP][515] ([Intel XE#2486])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_panel_fitting@legacy.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][516] ([Intel XE#616]) -> [SKIP][517] ([Intel XE#2423] / [i915#2575])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_plane_cursor@primary.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][518] ([Intel XE#2393]) -> [SKIP][519] ([Intel XE#2423])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][520] ([Intel XE#2423]) -> [SKIP][521] ([Intel XE#2493])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][522] ([Intel XE#2423]) -> [SKIP][523] ([Intel XE#2763]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][524] ([Intel XE#2763]) -> [SKIP][525] ([Intel XE#2423]) +2 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][526] ([Intel XE#870]) -> [SKIP][527] ([Intel XE#2136]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#2136]) -> [SKIP][529] ([Intel XE#870])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-bmg:          [SKIP][530] ([Intel XE#2136]) -> [SKIP][531] ([Intel XE#870])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][533] ([Intel XE#1122])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-dg2-set2:     [DMESG-WARN][534] ([Intel XE#1033]) -> [SKIP][535] ([Intel XE#2136]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][537] ([Intel XE#908])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][538] ([Intel XE#2392]) -> [SKIP][539] ([Intel XE#2136])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#2136]) -> [SKIP][541] ([Intel XE#908])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][542] ([Intel XE#2446]) -> [SKIP][543] ([Intel XE#1439] / [Intel XE#836])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][544] ([Intel XE#2446]) -> [SKIP][545] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][546] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][547] ([Intel XE#2446])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][548] ([Intel XE#2446]) -> [DMESG-WARN][549] ([Intel XE#4172])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [DMESG-WARN][550] ([Intel XE#1033] / [Intel XE#2042]) -> [SKIP][551] ([Intel XE#2446])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-bmg:          [DMESG-WARN][552] ([Intel XE#4172]) -> [SKIP][553] ([Intel XE#2446])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@invalid-properties-legacy:
    - shard-bmg:          [SKIP][554] ([Intel XE#2423]) -> [DMESG-WARN][555] ([Intel XE#4172]) +3 other tests dmesg-warn
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_properties@invalid-properties-legacy.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_properties@invalid-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][556] ([Intel XE#2136]) -> [SKIP][557] ([Intel XE#1489]) +6 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#1489]) -> [SKIP][559] ([Intel XE#2136]) +8 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#2136]) -> [SKIP][561] ([Intel XE#1489]) +11 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][562] ([Intel XE#1489]) -> [SKIP][563] ([Intel XE#2136]) +6 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][564] ([Intel XE#2387]) -> [SKIP][565] ([Intel XE#2136])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#2136]) -> [SKIP][567] ([Intel XE#1122]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][568] ([Intel XE#2136]) -> [SKIP][569] ([Intel XE#2387]) +1 other test skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][571] ([Intel XE#2136] / [Intel XE#2351])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_psr@fbc-pr-suspend.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#2136]) -> [SKIP][573] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][575] ([Intel XE#2136]) +17 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][576] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][577] ([Intel XE#2136]) +16 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][579] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][580] ([Intel XE#2136]) -> [SKIP][581] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][582] ([Intel XE#2136]) -> [SKIP][583] ([Intel XE#2414])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#2939]) -> [SKIP][585] ([Intel XE#2136])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][586] ([Intel XE#2423]) -> [SKIP][587] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#2423] / [i915#2575]) -> [SKIP][589] ([Intel XE#3414]) +3 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#2423] / [i915#2575]) -> [SKIP][591] ([Intel XE#1127]) +1 other test skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][592] ([Intel XE#2330]) -> [SKIP][593] ([Intel XE#2423]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#1127]) -> [SKIP][595] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#3414]) -> [SKIP][597] ([Intel XE#2423] / [i915#2575])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][598] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][599] ([Intel XE#2423])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][600] ([Intel XE#2413]) -> [SKIP][601] ([Intel XE#2423])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][602] ([Intel XE#1435]) -> [SKIP][603] ([Intel XE#2423])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][604] ([Intel XE#1729]) -> [SKIP][605] ([Intel XE#2423] / [i915#2575])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][607] ([Intel XE#1033]) +1 other test dmesg-warn
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][608] ([Intel XE#2423]) -> [SKIP][609] ([Intel XE#2168])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_vrr@cmrr.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#2423] / [i915#2575]) -> [SKIP][611] ([Intel XE#2168])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_vrr@cmrr.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#455]) -> [SKIP][613] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_vrr@flipline.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_vrr@flipline.html
    - shard-bmg:          [SKIP][614] ([Intel XE#1499]) -> [SKIP][615] ([Intel XE#2423]) +2 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_vrr@flipline.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][616] ([Intel XE#756]) -> [SKIP][617] ([Intel XE#2423])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#2423] / [i915#2575]) -> [SKIP][619] ([Intel XE#756])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][620] ([Intel XE#2423]) -> [SKIP][621] ([Intel XE#756]) +2 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][623] ([Intel XE#2423] / [i915#2575])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][624] ([Intel XE#2705]) -> [SKIP][625] ([Intel XE#2423])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@testdisplay.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#1123]) -> [SKIP][627] ([Intel XE#1130])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#1126]) -> [SKIP][629] ([Intel XE#1130])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#1130]) -> [SKIP][631] ([Intel XE#1126])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][632] ([Intel XE#2504]) -> [SKIP][633] ([Intel XE#1130])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#2905]) -> [SKIP][635] ([Intel XE#1130]) +11 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][636] ([Intel XE#1130]) -> [SKIP][637] ([Intel XE#2905]) +10 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][638] ([Intel XE#1130]) -> [SKIP][639] ([Intel XE#3889])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#1130]) -> [SKIP][641] ([Intel XE#3889])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          [SKIP][642] ([Intel XE#2905]) -> [SKIP][643] ([Intel XE#1130]) +11 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#1130]) -> [SKIP][645] ([Intel XE#2905]) +6 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_eudebug_online@preempt-breakpoint.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_exec_balancer@many-cm-parallel-rebind:
    - shard-bmg:          [SKIP][646] ([Intel XE#1130]) -> [DMESG-WARN][647] ([Intel XE#4172])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_exec_balancer@many-cm-parallel-rebind.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][648] ([Intel XE#1130]) -> [SKIP][649] ([Intel XE#2322]) +9 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#1392]) -> [SKIP][651] ([Intel XE#1130])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][652] ([Intel XE#2322]) -> [SKIP][653] ([Intel XE#1130]) +10 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#1130]) -> [SKIP][655] ([Intel XE#1392])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#1130]) -> [SKIP][657] ([Intel XE#288]) +25 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#288]) -> [SKIP][659] ([Intel XE#1130]) +24 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][660] ([Intel XE#2360]) -> [SKIP][661] ([Intel XE#1130])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#1130]) -> [SKIP][663] ([Intel XE#2360])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@spin:
    - shard-bmg:          [DMESG-WARN][664] ([Intel XE#4172]) -> [SKIP][665] ([Intel XE#1130])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_exec_reset@spin.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_exec_reset@spin.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][666] ([Intel XE#2229]) -> [DMESG-WARN][667] ([Intel XE#4172]) +1 other test dmesg-warn
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#455]) -> [SKIP][669] ([Intel XE#1192])
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_live_ktest@xe_eudebug.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][670] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][671] ([Intel XE#1130])
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@xe_media_fill@media-fill.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_media_fill@media-fill.html
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#560]) -> [SKIP][673] ([Intel XE#1130])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][674] ([Intel XE#1130]) -> [SKIP][675] ([Intel XE#586])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_mmap@small-bar.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][676] ([Intel XE#1130]) -> [SKIP][677] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][678] ([Intel XE#2248]) -> [SKIP][679] ([Intel XE#1130])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][681] ([Intel XE#1130]) +5 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#1337]) -> [SKIP][683] ([Intel XE#1130])
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][684] ([Intel XE#1130]) -> [SKIP][685] ([Intel XE#2245])
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][686] ([Intel XE#1130]) -> [SKIP][687] ([Intel XE#979])
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#1130]) -> [SKIP][689] ([Intel XE#2284] / [Intel XE#366])
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][690] ([Intel XE#2284]) -> [SKIP][691] ([Intel XE#1130]) +1 other test skip
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@xe_pm@d3cold-mocs.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     [SKIP][692] ([Intel XE#2284]) -> [SKIP][693] ([Intel XE#1130])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][694] ([Intel XE#1130]) -> [SKIP][695] ([Intel XE#2284]) +2 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][696] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][697] ([Intel XE#1130]) +1 other test skip
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][698] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][699] ([Intel XE#1130]) +1 other test skip
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][700] ([Intel XE#4172] / [Intel XE#569]) -> [SKIP][701] ([Intel XE#1130])
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][702] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][703] ([Intel XE#1130])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [SKIP][704] ([Intel XE#1130]) -> [ABORT][705] ([Intel XE#1033] / [Intel XE#4046])
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pm_residency@cpg-basic.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][706] ([Intel XE#1130]) -> [SKIP][707] ([Intel XE#944])
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_query@multigpu-query-config.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][708] ([Intel XE#944]) -> [SKIP][709] ([Intel XE#1130]) +3 other tests skip
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][710] ([Intel XE#1130]) -> [SKIP][711] ([Intel XE#944]) +3 other tests skip
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][712] ([Intel XE#944]) -> [SKIP][713] ([Intel XE#1130]) +3 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][714] ([Intel XE#4130]) -> [SKIP][715] ([Intel XE#1130])
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          [SKIP][716] ([Intel XE#1130]) -> [SKIP][717] ([Intel XE#4130])
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][718] ([Intel XE#4130]) -> [SKIP][719] ([Intel XE#1130]) +1 other test skip
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][720] ([Intel XE#1130]) -> [SKIP][721] ([Intel XE#3342])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          [SKIP][722] ([Intel XE#1130]) -> [SKIP][723] ([Intel XE#3342])
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][724] ([Intel XE#3342]) -> [SKIP][725] ([Intel XE#1130])
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8214 -> IGTPW_12514
  * Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -> xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139

  IGTPW_12514: 77e172e0fdb2e11ce0a86ce410282b2ac8772681 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79
  xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139: 45746920fb499b7ad35883c94ebfbedda6c40139

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/index.html

--===============8469103485833210670==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_rpm: Restrict cursor test=
s to I915 driver (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144000/">https://patchwork.freedesktop.org/series/144000/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8214_full -&gt; XEIGTPW_12514_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12514_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12514_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
514_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shar=
d-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-lnl-5/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1.ht=
ml">DMESG-WARN</a> +18 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12514_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@core_getstats.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@cor=
e_getstats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@core_getversion@all-cards.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2=
-433/igt@core_getversion@all-cards.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-4/igt@core_getversion@all-cards.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3=
/igt@core_getversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@core_hotunplug@hotunplug-rescan.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@fbdev@info.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@fbdev@info=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@fbdev@read.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_bw@connected-linear-tiling=
-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_bw@linear-tiling-1-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-=
tiled-dg2-mc-ccs@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-=
tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-til=
ed-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/314">Intel XE#314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_chamelium_color@degamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575">i915#2575</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-rig=
ht-edge@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +4 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2514/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
1">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl=
-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/ig=
t@kms_flip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +84 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514=
/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shar=
d-bmg-2/igt@kms_flip@flip-vs-panning-vs-hang.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172=
</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#13=
97</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-prim=
scrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprima=
ry.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledpr=
imary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-4/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-=
d-hdmi-a-6-size-256.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +5 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_plane_scaling@planes-unity=
-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@=
kms_pm_rpm@basic-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
514/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Inte=
l XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt=
@kms_sequence@get-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +76 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-=
0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_create@create-massive-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_eudebug@basic-vm-access-param=
eters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@xe_eudebug@discovery-race.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
05">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_eudebug_online@set-breakpoint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_evict@evict-large-external-cm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_basic@many-execqueues-=
many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@non-blocking:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_exec_compute_mode@non-blocking.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-bmg-3/igt@xe_exec_compute_mode@non-blocking.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +177 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_exec_fault_mode@once-invali=
d-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-=
batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/=
igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_mmap@pci-membarrier.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045"=
>Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-ln=
l-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard=
-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
214/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8214/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/s=
hard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12514/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12514/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shar=
d-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2514/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12514/shard-lnl-3/igt@xe_module_load@load.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@xe_module_load@many-reload.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-=
3/igt@xe_module_load@many-reload.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_module_load@many-reload.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-ln=
l-5/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2=
-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@x=
e_pm@s3-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other =
test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-d=
g2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel X=
E#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_pm@s4-basic.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Inte=
l XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-2/igt@x=
e_pm@s4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl=
-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"=
>Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shar=
d-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"=
>Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@xe_query@multigpu-query-invalid-=
uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-lnl-6/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@xe_vm@mmap-style-bind-userptr-one-partial.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12514/shard-dg2-433/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) +144 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/345=
3">Intel XE#3453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">In=
tel XE#3249</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-4=
63/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@fbdev@write.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-8=
/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-lnl-1/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">P=
ASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-8/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +22 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=
.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2=
-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_cursor_crc@cursor-slidin=
g-64x64.html">PASS</a> +104 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +75 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interr=
uptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_flip@flip-vs-su=
spend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS=
</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_frontbuffer_trac=
king@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +26 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-render.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_front=
buffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +11 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-7/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#244=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
14/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_vblank@wait-busy-hang.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel =
XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-bmg-4/igt@kms_vblank@wait-busy-hang.html">PASS</a> +3 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-dg2-463/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</a> +16=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-bmg-8/igt@xe_exec_basic@many-bindexecqueue-rebind.ht=
ml">PASS</a> +191 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-4=
63/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_module_load@reload.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/s=
hard-bmg-5/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Int=
el XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/56=
9">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel =
XE#4172</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12514/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#135=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794=
">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2233">Intel XE#2233</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/623">Intel XE#623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-sma=
ll-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">I=
ntel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124=
">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Int=
el XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
0">Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_bw@connected-linear-t=
iling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_bw@conn=
ected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_bw@connecte=
d-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_bw@linear-tiling-=
2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-1920x10=
80p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled=
-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2907">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-r=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3442">Intel XE#3442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-mc-ccs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@kms_ccs@missing-=
ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2692">Intel XE#2692</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12514/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
25">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">I=
ntel XE#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Int=
el XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hiberna=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-chan=
ge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_chamelium_e=
did@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel =
XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12514/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
341">Intel XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-bmg-3/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/239=
0">Intel XE#2390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_content_protection@=
dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390=
">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12514/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_content_protection@legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_content_protection@legacy.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341=
">Intel XE#2341</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12514/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">=
Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"=
>Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">In=
tel XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">=
Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-curso=
r-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_cursor_legacy@b=
asic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggl=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa=
-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Inte=
l XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-bmg-3/igt@kms_cursor_legacy@forked-bo.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_cursor_lega=
cy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-curso=
r-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sh=
ard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">=
Intel XE#2425</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel =
XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
14/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_feature_discovery@display-4=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#23=
74</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
514/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#=
1135</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12514/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12514/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#231=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_flip@flip-vs-panning.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel=
 XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-dg2-433/igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_flip_scaled=
_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_flip_scale=
d_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@km=
s_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_=
flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_frontbu=
ffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-434/igt@kms_frontbuffer_trac=
king@fbc-1p-primscrn-indfb-plflip-blt.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sh=
rfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcps=
r-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_frontbuffer_trackin=
g@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
41">Intel XE#4141</a>) +10 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/115=
8">Intel XE#1158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">In=
tel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +30 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">I=
ntel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2514/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2514/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">I=
ntel XE#346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12514/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_plane_cursor@primary.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-dg2-433/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#239=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
14/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12514/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-5/igt@kms_plane_scaling@plan=
es-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel X=
E#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12514/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Int=
el XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
514/shard-dg2-433/igt@kms_pm_dc@dc5-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard=
-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/s=
hard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel =
XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE=
#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#=
3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
36">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel X=
E#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Int=
el XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12514/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
72">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
33">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2042">Intel XE#2042</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_pm_rpm@system-suspen=
d-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172=
">Intel XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446=
">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_properties@invalid-properties-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-2/igt@kms_properties@invalid-properties-legacy.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-update-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_psr2_sf@psr2-cur=
sor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel=
 XE#2387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12514/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
514/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-433/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Inte=
l XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE=
#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel X=
E#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12514/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2939">Intel XE#2939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_psr_stress_test@invali=
date-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@kms_rotation_crc@pr=
imary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2330">Intel XE#2330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_rotation_crc@primary-y-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@kms_rotation_crc@sprite-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">=
Intel XE#2413</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
5">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12514/shard-dg2-466/igt@kms_vblank@ts-continuation-su=
spend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-=
4/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12514/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-=
dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 =
other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-=
bmg-3/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/75=
6">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12514/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-436/igt@kms_writeback@writebac=
k-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-bmg-8/igt@kms_writeback@writeback-invalid-paramet=
ers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"=
>Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@testdisplay.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-dg2-433/igt@testdisplay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"=
>Intel XE#1123</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">I=
ntel XE#1126</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">=
Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12514/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
26">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504"=
>Intel XE#2504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-extended-=
discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12514/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12514/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Inte=
l XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-bmg-3/igt@xe_eudebug_online@interrupt-other.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_eudebug_online@preempt-breakpoint.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"=
>Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_exec_balancer@many-cm-parallel-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-rebind.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-4/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_exec_basic@multigpu-on=
ce-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-defer-mmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-d=
efer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr=
-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-432/igt@xe_exec_fault_m=
ode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) =
+25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefe=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2360">Intel XE#2360</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-bat=
ch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma=
-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12514/shard-dg2-463/igt@xe_exec_mix_modes@exec-sp=
inner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@spin:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_exec_reset@spin.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-3/igt@xe_exec_reset@spin.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-bmg-5/igt@xe_live_ktest@xe_bo.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-dg2-434/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596"=
>Intel XE#2596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12514/shard-bmg-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard=
-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">I=
ntel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12514/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541=
">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_oa@whitelisted-r=
egisters-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel=
 XE#1337</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/s=
hard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
4/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
14/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel X=
E#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard=
-bmg-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test ski=
p</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/sha=
rd-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel X=
E#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12514/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#=
2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
66">Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel X=
E#4172</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel X=
E#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_pm@s4-vm-bind-unbind-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2514/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046"=
>Intel XE#4046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_query@multigpu-query-config.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel=
 XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel X=
E#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12514/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extensio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12514/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4130">Intel XE#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12514/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-r=
anges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12514/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-=
on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12514/shard-dg2-433/igt@xe_sriov_auto_p=
rovisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12514/shard-dg2-432/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Inte=
l XE#3342</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12514/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE=
#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#33=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
514/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8214 -&gt; IGTPW_12514</li>
<li>Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -&gt; xe-2571-4=
5746920fb499b7ad35883c94ebfbedda6c40139</li>
</ul>
<p>IGTPW_12514: 77e172e0fdb2e11ce0a86ce410282b2ac8772681 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc6=
09b9dd59ef1ffcd79<br />
  xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139: 45746920fb499b7ad35883c=
94ebfbedda6c40139</p>

</body>
</html>

--===============8469103485833210670==--
