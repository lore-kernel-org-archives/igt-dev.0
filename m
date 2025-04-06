Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A9C3600C
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 13:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7586810E270;
	Sun,  6 Apr 2025 13:33:42 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C446B10E0B4;
 Sun,  6 Apr 2025 13:33:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2951956048358713522=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_support_for_Xe_in_runt?=
 =?utf-8?q?ime-pm_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 13:33:41 -0000
Message-ID: <174394642178.40936.1078554847641872577@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327014827.1829635-1-soham.purkait@intel.com>
In-Reply-To: <20250327014827.1829635-1-soham.purkait@intel.com>
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

--===============2951956048358713522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Xe in runtime-pm (rev3)
URL   : https://patchwork.freedesktop.org/series/146379/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8288_FULL -> XEIGTPW_12849_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12849_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12849_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12849_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-lnl:          [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][4] -> [INCOMPLETE][5] +3 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_pm_residency@idle-residency-on-exec.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12849_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#911]) +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#873])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +12 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +179 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2669]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2907]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +21 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4416]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#306]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +9 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2390])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#307])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1188]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1188])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#308])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2321]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#309])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#323])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#309]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2291]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-lnl:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#3226]) +1 other test incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@kms_cursor_legacy@forked-move.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1508])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4494])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1340])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4331])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2244])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +15 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4422])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4422]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4422])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#3321]) +4 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1421]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#310]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#310])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2316]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#3321])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#886]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1401] / [Intel XE#1745])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1401])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2311]) +23 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#656]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4141]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#651]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2312]) +10 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2313]) +29 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4439])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#656]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#656]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#653]) +15 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#1503])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#3012])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4329])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][99] -> [FAIL][100] ([Intel XE#616]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#4596])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-none.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][103] ([Intel XE#4212])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][104] ([Intel XE#4540]) +1 other test abort
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#870])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2391])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#718])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2505])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#908])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1489]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1489]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2893])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1406])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][116] ([Intel XE#4568]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2414])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2939])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#3414] / [Intel XE#3904])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1435]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2426])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#771])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-lnl:          [PASS][126] -> [INCOMPLETE][127] ([Intel XE#4207]) +1 other test incomplete
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1499])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1499])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#756])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#756])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2905] / [Intel XE#3889])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2905] / [Intel XE#4259])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2905]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2905]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#4577])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#4577])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#4518])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4518])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#688])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2322]) +8 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#1392]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1392]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#288]) +16 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
    - shard-bmg:          NOTRUN -> [FAIL][146] ([Intel XE#3903])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#255])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][148] -> [FAIL][149] ([Intel XE#1999]) +2 other tests fail
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2459] / [Intel XE#2596])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175]) -> ([PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [SKIP][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198]) ([Intel XE#378])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218]) -> ([PASS][219], [PASS][220], [PASS][221], [SKIP][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240]) ([Intel XE#2457])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][241] -> [FAIL][242] ([Intel XE#4541])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_oa@buffer-size.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_oa@buffer-size.html
    - shard-bmg:          [PASS][243] -> [FAIL][244] ([Intel XE#4541])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_oa@buffer-size.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@ccs-0-256k:
    - shard-lnl:          NOTRUN -> [FAIL][245] ([Intel XE#4541])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_oa@buffer-size@ccs-0-256k.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-bmg:          NOTRUN -> [FAIL][246] ([Intel XE#4541])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#2284])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#2284])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2284] / [Intel XE#366])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#584])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][253] ([Intel XE#944])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#944]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#944]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#4130])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#3342])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#4351])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2191]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][261] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][263] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][265] ([Intel XE#4212] / [Intel XE#4345]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#309]) -> [PASS][268] +3 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][269] ([Intel XE#2291]) -> [PASS][270] +1 other test pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][271] ([Intel XE#4302]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#3009]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_dp_aux_dev.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#310]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][277] ([Intel XE#3321]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][279] ([Intel XE#2316]) -> [PASS][280] +2 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][281] ([Intel XE#301]) -> [PASS][282] +1 other test pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][283] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#656]) -> [PASS][286] +6 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#455]) -> [PASS][288] +3 other tests pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][289] ([Intel XE#616]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4596]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#836]) -> [PASS][294] +1 other test pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][295] ([Intel XE#2883]) -> [PASS][296] +2 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1392]) -> [PASS][298] +2 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][300] ([Intel XE#787]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#787]) -> [SKIP][302] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4440]) -> [SKIP][304] ([Intel XE#4418])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][305] ([Intel XE#2341]) -> [FAIL][306] ([Intel XE#1178])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@kms_content_protection@atomic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#455]) -> [FAIL][308] ([Intel XE#1178])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_content_protection@srm.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#455]) -> [FAIL][310] ([Intel XE#1188])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_content_protection@uevent.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][311] ([Intel XE#301]) -> [SKIP][312] ([Intel XE#310])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#656]) -> [SKIP][314] ([Intel XE#651]) +11 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#651]) -> [SKIP][316] ([Intel XE#656]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][317] ([Intel XE#2311]) -> [SKIP][318] ([Intel XE#2312]) +13 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][319] ([Intel XE#2312]) -> [SKIP][320] ([Intel XE#4141]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][321] ([Intel XE#4141]) -> [SKIP][322] ([Intel XE#2312]) +6 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][323] ([Intel XE#2312]) -> [SKIP][324] ([Intel XE#2311]) +14 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][325] ([Intel XE#2313]) -> [SKIP][326] ([Intel XE#2312]) +14 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#656]) -> [SKIP][328] ([Intel XE#653]) +8 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][329] ([Intel XE#2312]) -> [SKIP][330] ([Intel XE#2313]) +14 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#653]) -> [SKIP][332] ([Intel XE#656]) +6 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][333] ([Intel XE#4596]) -> [SKIP][334] ([Intel XE#2493])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4596]) -> [SKIP][336] ([Intel XE#455])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][337] ([Intel XE#2705] / [Intel XE#4540]) -> [ABORT][338] ([Intel XE#4540])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/igt@testdisplay.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@testdisplay.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
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
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3903]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3903
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4207
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8288 -> IGTPW_12849

  IGTPW_12849: 12849
  IGT_8288: 8288
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/index.html

--===============2951956048358713522==
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
<tr><td><b>Series:</b></td><td>Add support for Xe in runtime-pm (rev3)</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146379/">https://patchwork.freedesktop.org/series/146379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12849/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12849/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8288_FULL -&gt; XEIGTPW_12849_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12849_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12849_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
849_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@core_hotunplug@hotreplug-latec=
lose.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12849/shard-lnl-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.ht=
ml">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-2/igt@xe_pm_residency@idle-residency-on-exec.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
9/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html">INCOMPLETE</=
a> +3 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12849_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12849/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_bw@linear-tiling-3-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +179 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_chamelium_color@degamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@kms_chamelium_edid@dp-mode-timin=
gs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_chamelium_frames@vga-frame=
-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_content_protection@srm@pip=
e-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_content_protection@uevent.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@kms_content_protection@uevent@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_cursor_legacy@2x-long-curs=
or-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12849/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-ato=
mic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12849/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-6/igt@kms_cursor_legacy@forked-move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-l=
nl-7/igt@kms_cursor_legacy@forked-move.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12849/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/=
shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-=
race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12849/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
9/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
 +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12849/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012=
">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12849/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-si=
ze-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-none.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/s=
hard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) +1 other test abort</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@kms_psr@fbc-pr-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4568">Intel XE#4568</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12849/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/sh=
ard-lnl-4/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4207">Intel XE#4=
207</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@kms_writeback@writeback-check-ou=
tput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_eudebug@basic-vm-access-param=
eters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_eudebug@read-metadata.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@xe_eudebug_online@resume-dss.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_evict@evict-beng-large-extern=
al-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-432/igt@xe_exec_basic@multigp=
u-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@xe_exec_fault_mode@many-execqu=
eues-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@xe_fault_injection@oa-add-config=
-fail-xe_oa_alloc_regs.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3903">Intel XE#3903</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12849/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_ku=
nit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8288/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
288/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/s=
hard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12849/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12849/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
9/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12849/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12849/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12849/shard-lnl-1/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shar=
d-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2849/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-3/igt@xe_module_lo=
ad@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/378">Intel XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8288/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
288/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12849/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2849/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12849/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12849/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12849/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12849/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@xe_oa@buffer-size.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@x=
e_oa@buffer-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4541">Intel XE#4541</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@xe_oa@buffer-size.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@x=
e_oa@buffer-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@ccs-0-256k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_oa@buffer-size@ccs-0-256k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@xe_oa@privileged-forked-access=
-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-=
version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-lnl-4/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12849/shard-bmg-1/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms_bw@connected-linear-t=
iling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-434/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12849/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-l=
egacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12849/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-=
dg2-436/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-o=
ff-vs-modeset-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12849/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel=
 XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12849/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> +6 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
49/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12849/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#=
836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2849/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12849/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +2 other t=
ests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-436/igt@kms_ccs@ccs-on=
-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc=
-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_ccs@crc-s=
prite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440=
">Intel XE#4440</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12849/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12849/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
849/shard-dg2-432/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12849/shard-dg2-433/igt@kms_content_protection@uevent.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1=
188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12849/shard-bmg-6/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-463/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12849/shard-bmg-2/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other te=
sts skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12849/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12849/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12849/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@testdisplay.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#=
4540</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12849/shard-dg2-432/igt@testdisplay.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8288 -&gt; IGTPW_12849</li>
</ul>
<p>IGTPW_12849: 12849<br />
  IGT_8288: 8288<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8</p>

</body>
</html>

--===============2951956048358713522==--
