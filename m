Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C25C0218D
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 01:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3F110E1E2;
	Thu, 30 Jan 2025 01:14:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14110E1E2;
 Thu, 30 Jan 2025 01:14:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3711999367969927863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fjoiner?=
 =?utf-8?q?=3A_Add_a_new_test_to_validate_non-joiner_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jan 2025 01:14:10 -0000
Message-ID: <173819965040.2640361.13437125339190676623@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129171754.3654118-1-jeevan.b@intel.com>
In-Reply-To: <20250129171754.3654118-1-jeevan.b@intel.com>
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

--===============3711999367969927863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev2)
URL   : https://patchwork.freedesktop.org/series/143972/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8214_full -> XEIGTPW_12513_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12513_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12513_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12513_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][4] ([Intel XE#2341]) -> [TIMEOUT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  
New tests
---------

  New tests have been introduced between XEIGT_8214_full and XEIGTPW_12513_full:

### New IGT tests (2) ###

  * igt@kms_joiner@basic-non-joiner:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@kms_joiner@basic-non-joiner@non-joiner:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12513_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#2423]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@core_getstats.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [PASS][8] -> [FAIL][9] ([Intel XE#3440])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@core_getversion@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          NOTRUN -> [ABORT][10] ([Intel XE#3914])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@fbdev@eof.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@fbdev@eof.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2134]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@fbdev@write.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@fbdev@write.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2423]) +11 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#873])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2423] / [i915#2575]) +34 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2136]) +45 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2136]) +14 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2327])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#316])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#610])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1512])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +160 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#3432])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1152]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#306]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][43] ([Intel XE#4172]) +5 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#3304])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#3278])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1424]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2286])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2291]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#309])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][55] ([Intel XE#3226])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1340])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2244])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2372])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][60] ([Intel XE#1033]) +7 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1421]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2423] / [i915#2575]) +90 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_flip@busy-flip.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#3321])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#301]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#886]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2293]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1397] / [Intel XE#1745])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1397])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293] / [Intel XE#2380])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#651]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2136]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#2136]) +18 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4141]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2311]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#656]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#653]) +15 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2313]) +10 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][90] ([Intel XE#2625] / [Intel XE#4048])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1503])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2927])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:
    - shard-bmg:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#4172]) +33 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2763]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-bmg:          [PASS][96] -> [DMESG-WARN][97] ([Intel XE#2566] / [Intel XE#4172]) +1 other test dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2763] / [Intel XE#455]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2763]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#870])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][102] ([Intel XE#718])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#3309])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#2446]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_pm_rpm@i2c.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_pm_rpm@i2c.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2446])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][107] -> [DMESG-WARN][108] ([Intel XE#1033]) +11 other tests dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#2446]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#2423]) +83 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2893])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1489])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1489]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2234])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2414])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#3414])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#3414] / [Intel XE#3904])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][122] -> [FAIL][123] ([Intel XE#2883]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_setmode@basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#756])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1123])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2905]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#3889])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2905]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2905]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][131] ([Intel XE#1033] / [Intel XE#1473])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-bmg:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#1473] / [Intel XE#4172])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_evict@evict-beng-small-multi-vm.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#688]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2322]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1130]) +149 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#288]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2360])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1130]) +72 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#584]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#1999]) +2 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168]) -> ([PASS][169], [SKIP][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194]) ([Intel XE#378])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][195] -> [FAIL][196] ([Intel XE#3546])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_module_load@reload-no-display.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2427])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_peer2peer@write.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#1061])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [PASS][200] -> [ABORT][201] ([Intel XE#1358]) +1 other test abort
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][202] -> [DMESG-WARN][203] ([Intel XE#4172] / [Intel XE#569])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@xe_pm@s3-exec-after.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][204] -> [ABORT][205] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [PASS][206] -> [DMESG-WARN][207] ([Intel XE#2280] / [Intel XE#4172])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#944])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#944])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#944]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][211] -> [SKIP][212] ([Intel XE#1130]) +188 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@xe_query@query-gt-list.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_query@query-gt-list.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#3342])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-3145728:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#1130]) +12 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2423]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@core_getclient.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@core_getclient.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2134]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@fbdev@unaligned-write.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@fbdev@unaligned-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][219] ([Intel XE#3908]) -> [PASS][220] +3 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][221] ([Intel XE#2136]) -> [PASS][222] +20 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][224] +4 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][225] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2423] / [i915#2575]) -> [PASS][228] +81 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][229] ([Intel XE#4172]) -> [PASS][230] +5 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][231] ([Intel XE#2291]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [INCOMPLETE][233] ([Intel XE#3226]) -> [PASS][234] +1 other test pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][235] ([Intel XE#2425]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][237] ([Intel XE#2423]) -> [PASS][238] +84 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][239] ([Intel XE#2316]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-panning@a-dp4:
    - shard-dg2-set2:     [INCOMPLETE][241] ([Intel XE#2049]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_flip@flip-vs-panning@a-dp4.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_flip@flip-vs-panning@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136]) -> [PASS][244] +23 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][245] ([Intel XE#2571]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-dg2-set2:     [DMESG-WARN][247] ([Intel XE#1033]) -> [PASS][248] +3 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_pm_dc@dc5-dpms.html
    - shard-lnl:          [FAIL][249] ([Intel XE#718]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2446]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][253] ([Intel XE#2446]) -> [PASS][254] +2 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][255] ([Intel XE#899]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][257] ([Intel XE#1130]) -> [PASS][258] +195 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1392]) -> [PASS][260] +2 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1130]) -> [PASS][262] +138 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
    - shard-bmg:          [SKIP][265] ([Intel XE#2229]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2229]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][269] ([Intel XE#1192]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [FAIL][271] ([Intel XE#1999]) -> [PASS][272] +2 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][273] ([Intel XE#3546]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_module_load@reload.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_module_load@reload.html
    - shard-bmg:          [FAIL][275] ([Intel XE#3546]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_module_load@reload.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@xe_module_load@reload.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [DMESG-WARN][277] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_pm@s3-mocs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][279] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [DMESG-WARN][281] ([Intel XE#1033]) -> [SKIP][282] ([Intel XE#2136])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][283] ([Intel XE#3768]) -> [SKIP][284] ([Intel XE#2423])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][285] ([Intel XE#2370]) -> [SKIP][286] ([Intel XE#2423]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136]) -> [DMESG-WARN][288] ([Intel XE#1033]) +1 other test dmesg-warn
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#316]) -> [SKIP][290] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#2327]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][293] ([Intel XE#2327]) -> [SKIP][294] ([Intel XE#2136]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#316]) -> [SKIP][296] ([Intel XE#2136]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][297] ([Intel XE#2136]) -> [DMESG-WARN][298] ([Intel XE#4172]) +3 other tests dmesg-warn
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][300] ([Intel XE#1033])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][301] ([Intel XE#1124]) -> [SKIP][302] ([Intel XE#2136]) +9 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#1124]) +9 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#607])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][307] ([Intel XE#610]) -> [SKIP][308] ([Intel XE#2136])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#610]) -> [SKIP][310] ([Intel XE#2136])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1124]) -> [SKIP][312] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][314] ([Intel XE#1124]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#1124]) +11 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1124]) -> [SKIP][318] ([Intel XE#2136]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][319] ([Intel XE#2328]) -> [SKIP][320] ([Intel XE#2136])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2191]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [SKIP][324] ([Intel XE#2314] / [Intel XE#2894])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2423] / [i915#2575]) -> [SKIP][326] ([Intel XE#2191])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][327] ([Intel XE#367]) -> [SKIP][328] ([Intel XE#2423]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#367]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#367]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#367]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][335] ([Intel XE#2887]) -> [SKIP][336] ([Intel XE#2136]) +10 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][338] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][340] ([Intel XE#2136]) +6 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#2907]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][343] ([Intel XE#1033]) -> [SKIP][344] ([Intel XE#2136] / [Intel XE#2351])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][345] ([Intel XE#2136]) -> [SKIP][346] ([Intel XE#2652] / [Intel XE#787])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][348] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2136]) -> [SKIP][350] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#3442]) -> [SKIP][352] ([Intel XE#2136])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][353] ([Intel XE#3432]) -> [SKIP][354] ([Intel XE#2136])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#2887]) +12 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][357] ([Intel XE#2692] / [Intel XE#4010]) -> [SKIP][358] ([Intel XE#2136])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][359] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][360] ([Intel XE#2136])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][361] ([Intel XE#2724]) -> [SKIP][362] ([Intel XE#2136])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_cdclk@mode-transition.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][363] ([Intel XE#2423]) -> [SKIP][364] ([Intel XE#2325]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][365] ([Intel XE#2325]) -> [SKIP][366] ([Intel XE#2423]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#306]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2423] / [i915#2575]) -> [SKIP][370] ([Intel XE#306]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#373]) +9 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][373] ([Intel XE#2252]) -> [SKIP][374] ([Intel XE#2423]) +8 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#373]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575]) +15 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][377] ([Intel XE#2423]) -> [SKIP][378] ([Intel XE#2252]) +8 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [FAIL][380] ([Intel XE#1178]) +1 other test fail
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_content_protection@atomic.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2423] / [i915#2575]) -> [FAIL][382] ([Intel XE#1178])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#307]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][385] ([Intel XE#2390]) -> [SKIP][386] ([Intel XE#2423])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][387] ([Intel XE#2423]) -> [SKIP][388] ([Intel XE#2390])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][389] ([Intel XE#1178]) -> [SKIP][390] ([Intel XE#2423])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_content_protection@legacy.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][391] ([Intel XE#2423]) -> [SKIP][392] ([Intel XE#2341]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_content_protection@mei-interface.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][393] ([Intel XE#2341]) -> [SKIP][394] ([Intel XE#2423])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_content_protection@type1.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][395] ([Intel XE#2423]) -> [SKIP][396] ([Intel XE#2320]) +7 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][397] ([Intel XE#2320]) -> [SKIP][398] ([Intel XE#2423]) +4 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2423] / [i915#2575]) -> [SKIP][400] ([Intel XE#455]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#308]) -> [SKIP][402] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-bmg:          [SKIP][403] ([Intel XE#2423]) -> [SKIP][404] ([Intel XE#2321])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#2423] / [i915#2575]) -> [SKIP][406] ([Intel XE#308])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][407] ([Intel XE#2321]) -> [SKIP][408] ([Intel XE#2423]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][410] ([Intel XE#1033])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#323]) -> [SKIP][412] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          [SKIP][413] ([Intel XE#2286]) -> [SKIP][414] ([Intel XE#2423]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][415] ([Intel XE#2423]) -> [SKIP][416] ([Intel XE#2286])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][417] ([Intel XE#2136]) -> [SKIP][418] ([Intel XE#3070])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#455]) -> [SKIP][420] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          [SKIP][421] ([Intel XE#2244]) -> [SKIP][422] ([Intel XE#2136]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2136]) -> [SKIP][424] ([Intel XE#455])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#2244])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#776]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2136]) -> [SKIP][430] ([Intel XE#776]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2423] / [i915#2575]) -> [SKIP][432] ([Intel XE#1138])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][433] ([Intel XE#2423]) -> [SKIP][434] ([Intel XE#2374])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][435] ([Intel XE#2423]) -> [SKIP][436] ([Intel XE#2316])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [SKIP][437] ([Intel XE#2316]) -> [SKIP][438] ([Intel XE#2423])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][439] ([Intel XE#3321]) -> [SKIP][440] ([Intel XE#2423]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2423] / [i915#2575]) -> [FAIL][442] ([Intel XE#301])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][443] ([Intel XE#2423]) -> [FAIL][444] ([Intel XE#3321])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2-set2:     [INCOMPLETE][445] ([Intel XE#2049]) -> [DMESG-WARN][446] ([Intel XE#1033])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_flip@flip-vs-panning.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][450] ([Intel XE#455]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][451] ([Intel XE#2380]) -> [SKIP][452] ([Intel XE#2136])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][453] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][454] ([Intel XE#2136]) +5 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#455]) -> [SKIP][456] ([Intel XE#2136]) +3 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][457] ([Intel XE#2311]) -> [SKIP][458] ([Intel XE#2312]) +6 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][459] ([Intel XE#2312]) -> [SKIP][460] ([Intel XE#2136]) +7 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][461] ([Intel XE#2312]) -> [SKIP][462] ([Intel XE#2311]) +4 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][463] ([Intel XE#2136]) -> [SKIP][464] ([Intel XE#2311]) +29 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2136]) -> [SKIP][466] ([Intel XE#651]) +15 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][467] ([Intel XE#2311]) -> [SKIP][468] ([Intel XE#2136]) +25 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#651]) -> [SKIP][470] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][471] ([Intel XE#4141]) -> [SKIP][472] ([Intel XE#2136]) +10 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][473] ([Intel XE#2312]) -> [SKIP][474] ([Intel XE#4141]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][475] ([Intel XE#4141]) -> [SKIP][476] ([Intel XE#2312]) +3 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][477] ([Intel XE#2136]) -> [SKIP][478] ([Intel XE#4141]) +11 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][479] ([Intel XE#2352]) -> [SKIP][480] ([Intel XE#2136])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#651]) -> [SKIP][482] ([Intel XE#2136]) +21 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][484] ([Intel XE#651]) +10 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#2136]) -> [SKIP][486] ([Intel XE#653]) +15 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][487] ([Intel XE#2136]) -> [SKIP][488] ([Intel XE#2312]) +6 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][489] ([Intel XE#2136]) -> [SKIP][490] ([Intel XE#2313]) +31 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][491] ([Intel XE#2312]) -> [SKIP][492] ([Intel XE#2313]) +6 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][494] ([Intel XE#653]) +6 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#653]) -> [SKIP][496] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][498] ([Intel XE#658])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][499] ([Intel XE#2136]) -> [SKIP][500] ([Intel XE#2350])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#653]) -> [SKIP][502] ([Intel XE#2136]) +24 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][503] ([Intel XE#2313]) -> [SKIP][504] ([Intel XE#2136]) +30 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][505] ([Intel XE#2313]) -> [SKIP][506] ([Intel XE#2312]) +9 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2423] / [i915#2575]) -> [SKIP][508] ([Intel XE#605])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][509] ([Intel XE#2340]) -> [SKIP][510] ([Intel XE#2423])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#2423] / [i915#2575]) -> [ABORT][512] ([Intel XE#2625])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_hdr@bpc-switch-suspend.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][513] ([Intel XE#3544]) -> [SKIP][514] ([Intel XE#3374] / [Intel XE#3544])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][515] ([Intel XE#1503]) -> [SKIP][516] ([Intel XE#2423])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#2136]) -> [SKIP][518] ([Intel XE#346])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#2423] / [i915#2575]) -> [SKIP][520] ([Intel XE#356])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#455]) -> [SKIP][522] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [SKIP][523] ([Intel XE#2423]) -> [DMESG-WARN][524] ([Intel XE#4172]) +7 other tests dmesg-warn
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][525] ([Intel XE#2493]) -> [SKIP][526] ([Intel XE#2423])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][527] ([Intel XE#2423]) -> [SKIP][528] ([Intel XE#2493])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][530] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][531] ([Intel XE#2423]) -> [SKIP][532] ([Intel XE#2763]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#2423] / [i915#2575]) -> [SKIP][534] ([Intel XE#2763] / [Intel XE#455])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][535] ([Intel XE#2763]) -> [SKIP][536] ([Intel XE#2423]) +3 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#870]) -> [SKIP][538] ([Intel XE#2136])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#2938]) -> [SKIP][540] ([Intel XE#2136])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][541] ([Intel XE#870]) -> [SKIP][542] ([Intel XE#2136])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][543] ([Intel XE#2391]) -> [SKIP][544] ([Intel XE#2136])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][546] ([Intel XE#908])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#2136]) -> [SKIP][548] ([Intel XE#908])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][549] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][550] ([Intel XE#2446])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][551] ([Intel XE#2446]) -> [SKIP][552] ([Intel XE#1439] / [Intel XE#836])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][553] ([Intel XE#2446]) -> [SKIP][554] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#2136]) -> [SKIP][556] ([Intel XE#1489]) +9 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#1489]) -> [SKIP][558] ([Intel XE#2136]) +10 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][559] ([Intel XE#2136]) -> [SKIP][560] ([Intel XE#1489]) +7 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][561] ([Intel XE#1489]) -> [SKIP][562] ([Intel XE#2136]) +8 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][563] ([Intel XE#2387]) -> [SKIP][564] ([Intel XE#2136])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#2136]) -> [SKIP][566] ([Intel XE#1122])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][567] ([Intel XE#2136]) -> [SKIP][568] ([Intel XE#2387])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][570] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][572] ([Intel XE#2136]) +14 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][574] ([Intel XE#2136] / [Intel XE#2351])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@kms_psr@pr-dpms.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#2136]) -> [SKIP][576] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-bmg:          [SKIP][577] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][578] ([Intel XE#2136]) +14 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_psr@psr-cursor-render.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][579] ([Intel XE#2136]) -> [SKIP][580] ([Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][581] ([Intel XE#2423]) -> [SKIP][582] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2423] / [i915#2575]) -> [SKIP][584] ([Intel XE#3414]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#2423] / [i915#2575]) -> [SKIP][586] ([Intel XE#1127])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][587] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][588] ([Intel XE#2423]) +1 other test skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][589] ([Intel XE#2413]) -> [SKIP][590] ([Intel XE#2423])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][591] ([Intel XE#1435]) -> [SKIP][592] ([Intel XE#2423]) +1 other test skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][593] ([Intel XE#1729]) -> [SKIP][594] ([Intel XE#2426])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][595] ([Intel XE#2426]) -> [SKIP][596] ([Intel XE#2509])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#2423] / [i915#2575]) -> [SKIP][598] ([Intel XE#1500])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [DMESG-WARN][599] ([Intel XE#4172]) -> [SKIP][600] ([Intel XE#2423])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@kms_vblank@query-busy.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_vblank@query-busy.html
    - shard-dg2-set2:     [DMESG-WARN][601] ([Intel XE#1033]) -> [SKIP][602] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@kms_vblank@query-busy.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][603] ([Intel XE#2423]) -> [SKIP][604] ([Intel XE#2168]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_vrr@lobf.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][605] ([Intel XE#1499]) -> [SKIP][606] ([Intel XE#2423]) +1 other test skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][607] ([Intel XE#2423]) -> [SKIP][608] ([Intel XE#756]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@kms_writeback@writeback-check-output.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#2423] / [i915#2575]) -> [SKIP][610] ([Intel XE#756]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#756]) -> [SKIP][612] ([Intel XE#2423] / [i915#2575])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#1123]) -> [SKIP][614] ([Intel XE#1130])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#1130]) -> [SKIP][616] ([Intel XE#1126]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1130]) -> [SKIP][618] ([Intel XE#2905]) +10 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_eudebug@basic-close.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][619] ([Intel XE#3889]) -> [SKIP][620] ([Intel XE#1130]) +1 other test skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][621] ([Intel XE#1130]) -> [SKIP][622] ([Intel XE#2905]) +12 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#3889]) -> [SKIP][624] ([Intel XE#1130]) +1 other test skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1130]) -> [SKIP][626] ([Intel XE#3889])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#2905]) -> [SKIP][628] ([Intel XE#1130]) +12 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][629] ([Intel XE#2905]) -> [SKIP][630] ([Intel XE#1130]) +8 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#2322]) +8 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][633] ([Intel XE#2322]) -> [SKIP][634] ([Intel XE#1130]) +8 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1392]) -> [SKIP][636] ([Intel XE#1130]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#1130]) -> [SKIP][638] ([Intel XE#1392]) +1 other test skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:
    - shard-bmg:          [SKIP][639] ([Intel XE#1130]) -> [DMESG-WARN][640] ([Intel XE#4172])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch:
    - shard-bmg:          [DMESG-WARN][641] ([Intel XE#4172]) -> [SKIP][642] ([Intel XE#1130])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#288]) -> [SKIP][644] ([Intel XE#1130]) +15 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#1130]) -> [SKIP][646] ([Intel XE#288]) +19 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_threads@threads-bal-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][647] ([Intel XE#1033]) -> [SKIP][648] ([Intel XE#1130]) +1 other test skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_exec_threads@threads-bal-userptr-invalidate.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_exec_threads@threads-bal-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#255]) -> [SKIP][650] ([Intel XE#1130])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][651] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][652] ([Intel XE#1130])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-7/igt@xe_media_fill@media-fill.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][653] ([Intel XE#1130]) -> [SKIP][654] ([Intel XE#586])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_mmap@small-bar.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][656] ([Intel XE#1130]) +6 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1130]) -> [SKIP][658] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_oa@non-zero-reason.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_oa@non-zero-reason.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][660] ([Intel XE#1130])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][661] ([Intel XE#1130]) -> [SKIP][662] ([Intel XE#2245])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1130]) -> [SKIP][664] ([Intel XE#979])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][666] ([Intel XE#1130])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@xe_pm@d3cold-basic.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#1130]) -> [SKIP][668] ([Intel XE#2284] / [Intel XE#366])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][669] ([Intel XE#2284]) -> [SKIP][670] ([Intel XE#1130]) +2 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][671] ([Intel XE#1130]) -> [SKIP][672] ([Intel XE#2284]) +2 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [SKIP][673] ([Intel XE#1130]) -> [DMESG-WARN][674] ([Intel XE#4172] / [Intel XE#569])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_pm@s3-basic-exec.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#1130]) -> [DMESG-WARN][676] ([Intel XE#1033] / [Intel XE#569])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pm@s3-exec-after.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][677] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][678] ([Intel XE#1130]) +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#579]) -> [SKIP][680] ([Intel XE#1130])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][681] ([Intel XE#579]) -> [SKIP][682] ([Intel XE#1130])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#1130]) -> [DMESG-WARN][684] ([Intel XE#1033])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_pm_residency@cpg-basic.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][685] ([Intel XE#944]) -> [SKIP][686] ([Intel XE#1130]) +2 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#944]) -> [SKIP][688] ([Intel XE#1130]) +1 other test skip
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#1130]) -> [SKIP][690] ([Intel XE#944])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][691] ([Intel XE#1130]) -> [SKIP][692] ([Intel XE#944]) +2 other tests skip
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#1130]) -> [SKIP][694] ([Intel XE#4130])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          [SKIP][695] ([Intel XE#1130]) -> [SKIP][696] ([Intel XE#4130])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][697] ([Intel XE#4130]) -> [SKIP][698] ([Intel XE#1130])
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#4130]) -> [SKIP][700] ([Intel XE#1130])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][701] ([Intel XE#1130]) -> [SKIP][702] ([Intel XE#3342])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          [SKIP][703] ([Intel XE#1130]) -> [SKIP][704] ([Intel XE#3342])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][705] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][706] ([Intel XE#1130])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
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
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8214 -> IGTPW_12513
  * Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -> xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15

  IGTPW_12513: 12513
  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79
  xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15: bdfc862a5c719d934efbdedb050ef891b9feef15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/index.html

--===============3711999367969927863==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Add a new test to va=
lidate non-joiner mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143972/">https://patchwork.freedesktop.org/series/143972/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12513/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8214_full -&gt; XEIGTPW_12513_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12513_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12513_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
513_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_=
enhance:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe=
_engine_class_video_enhance.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@xe_spin_batch@spin-t=
imestamp-check@engine-drm_xe_engine_class_video_enhance.html">DMESG-WARN</a=
></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@lic-type-0:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">TIMEOUT<=
/a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8214_full and XEIGTPW_12513=
_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_joiner@basic-non-joiner:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-non-joiner@non-joiner:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12513_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@core_getstats.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@cor=
e_getstats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@core_getversion@basic.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433=
/igt@core_getversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@fbdev@eof.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@fbdev@write.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@fbdev=
@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2134">Intel XE#2134</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_addfb_basic@bad-pitch-999.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
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
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_atomic@plane-invalid-param=
s-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/sh=
ard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-str=
ess-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_chamelium_frames@vga-frame=
-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_color@ctm-0-50@pipe-d-hdmi-a=
-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4172">Intel XE#4172</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_content_protection@lic-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-w=
f-vblank@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
1">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/ig=
t@kms_flip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +90 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblan=
k@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/sh=
ard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-l=
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
/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-l=
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
/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
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
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-i=
ndfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-prim=
scrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pip=
e-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4048">Intel XE#4048</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-=
dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-max@pi=
pe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4172">Intel XE#4172</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-up=
scale-20x20.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-f=
actor-0-5-upscale-20x20.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1=
 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@kms_plane_scaling@planes-downsca=
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
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_plane_scaling@planes-unity=
-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel=
 XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_pm=
_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_pm_rpm@i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel=
 XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
513/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033=
">Intel XE#1033</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-d=
g2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12513/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@k=
ms_setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-=
0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@xe_eudebug@basic-read-event.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_eudebug@basic-vm-access-param=
eters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_eudebug_online@writes-caching=
-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_evict@evict-beng-small-exte=
rnal.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/sh=
ard-bmg-2/igt@xe_evict@evict-beng-small-multi-vm.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1=
473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
72">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_evict@evict-large-external-cm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12513/shard-dg2-433/igt@xe_exec_basic@once-userptr-invalidate-race.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_exec_fault_mode@many-invali=
d-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_fault_injection@vm-create-f=
ail-xe_exec_queue_create_bind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +72 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
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
e/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-=
4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/s=
hard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12513/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12513/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shar=
d-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shar=
d-bmg-3/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_peer2peer@write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-d=
g2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 oth=
er test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@x=
e_pm@s3-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-2=
/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel=
 XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg=
-1/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4=
172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@xe_query@multigpu-query-invalid-=
uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-lnl-1/igt@xe_query@multigpu-query-oa-units=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@xe_query@query-gt-list.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/ig=
t@xe_query@query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +188 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-3145728:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_vm@mixed-userptr-misaligned-b=
inds-3145728.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@core_getclient.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-=
dg2-463/igt@core_getclient.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-dg2-466/igt@fbdev@unaligned-write.html">PASS</a> +1 other test pass=
</li>
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
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-lnl-3/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">P=
ASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_big_fb@4-tiled-ma=
x-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +20 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_big_fb@x-tiled=
-addfb-size-offset-overflow.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_bw@connecte=
d-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
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
rg/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_cursor_crc@cursor-slidin=
g-64x64.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">In=
tel XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12513/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggl=
e.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Inte=
l XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-bmg-8/igt@kms_cursor_legacy@forked-bo.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">=
Intel XE#2425</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12513/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interr=
uptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_flip@flip-vs-panning@a-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-dg2-466/igt@kms_flip@flip-vs-panning@a-dp4.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_flip_scale=
d_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +23 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
513/shard-dg2-463/igt@kms_pm_dc@dc5-dpms.html">PASS</a> +3 other tests pass=
</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-=
lnl-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#24=
46</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
513/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Int=
el XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.ht=
ml">PASS</a> +195 other tests pass</li>
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
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-4=
63/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12513/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.=
html">PASS</a> +138 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other te=
st pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/sha=
rd-bmg-7/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_ku=
nit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12513/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs=
_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_module_load@reload.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_module_load@reload.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/s=
hard-bmg-8/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Int=
el XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-dg2-436/igt@xe_pm@s3-mocs.html">PASS</a></li>
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
l-xe/IGTPW_12513/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
68">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12513/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_atomic_tran=
sition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_big_fb@x-tiled-ma=
x-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) =
+3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-=
180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms=
_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124=
">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">=
Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610=
">Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@y-tiled-max-h=
w-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_b=
ig_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#232=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
13/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_bw@connected-linear-t=
iling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_bw@conn=
ected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12513/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440=
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
ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_bw@linear-tiling-=
2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-1920x10=
80p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_ccs@bad-pixel=
-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 oth=
er tests skip</li>
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
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12513/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-c=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@crc-primary-basi=
c-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@crc-p=
rimary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_ccs@crc-primary-rota=
tion-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3442">Intel XE#3442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652=
">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#272=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
13/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel=
 XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12513/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel =
XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">In=
tel XE#2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">I=
ntel XE#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SK=
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
tel-xe/IGTPW_12513/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Int=
el XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12513/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_content_protection@atomic=
-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12513/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-=
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
el-xe/IGTPW_12513/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390=
">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12513/shard-bmg-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341=
">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#=
2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12513/shard-bmg-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">=
Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12513/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_cursor_crc@cursor-onscr=
een-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/308">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movemen=
t-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</l=
i>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_cursor_crc@cursor-slid=
ing-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">=
Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12513/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-edge.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_cursor_edge_walk@128x1=
28-top-edge.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-curso=
r-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1=
 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12513/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
70">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12513/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#=
2244</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12513/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12513/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
13/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) +1 =
other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)=
 +1 other test skip</li>
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
tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_feature_discovery@display-4=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
513/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12513/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-bmg-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_flip@flip-vs-panning.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel=
 XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12513/shard-dg2-466/igt@kms_flip@flip-vs-panning.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel =
XE#1033</a>)</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_flip_scaled=
_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) +4 other tests skip</li>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@km=
s_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_flip_s=
caled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>)</li>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_=
flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-=
ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_frontbuffer_tracking@drr=
s-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb=
101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
>Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">=
Intel XE#2352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuff=
er_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt=
@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">I=
ntel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-in=
dfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653=
">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdra=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
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
.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_frontbuffer_trackin=
g@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_frontbuffer_=
tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tes=
ts skip</li>
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
ntel-xe/IGTPW_12513/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">I=
ntel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2=
340</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625"=
>Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/sha=
rd-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_multipipe_mod=
eset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12513/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
72">Intel XE#4172</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12513/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
le-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_p=
lane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-7/igt@kms_plane_scaling@plan=
es-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-d=
ownscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/i=
gt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_plane_scalin=
g@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel=
 XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938=
">Intel XE#2938</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel X=
E#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12513/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel X=
E#2391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12513/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>)</li>
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
IGTPW_12513/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/s=
hard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Int=
el XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Inte=
l XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel =
XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE=
#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"=
>Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12513/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_psr2_sf@=
fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-4/igt@kms_psr2_sf@psr2-ov=
erlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel=
 XE#2387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12513/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
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
12513/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
513/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel X=
E#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12513/shard-dg2-433/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#9=
29</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12513/shard-bmg-3/igt@kms_psr@psr-cursor-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12513/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
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
x-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-436/igt@kms_rotation_crc@pr=
imary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@kms_rotation_crc@sprit=
e-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">In=
tel XE#2413</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">In=
tel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12513/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-466/igt@kms_tiled_di=
splay@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@kms_vblank@query-busy.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4=
172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-bmg-3/igt@kms_vblank@query-busy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@kms_vblank@query-busy.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12513/shard-dg2-433/igt@kms_vblank@query-busy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-=
7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12513/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@kms_writeback@writeback-check-output.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-bmg-1/igt@kms_writeback@writeback-check-output.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"=
>Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-463/igt@kms_writeback@writebac=
k-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-dg2-433/igt@kms_writeback@writeback-invalid-param=
eters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">I=
ntel XE#1123</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">=
Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3889">Intel XE#3889</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameter=
s-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12513/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3889">Intel XE#3889</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reco=
nnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12513/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel X=
E#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12513/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12513/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +8 other tests skip</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-6/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindex=
ecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12513/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">=
Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-bind.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic=
-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-pre=
fetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12513/shard-bmg-2/igt@xe_exec_fault_mode@many-bind=
execqueue-rebind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue=
-userptr-invalidate-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt=
@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefet=
ch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12513/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-=
imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr=
-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-432/igt@xe_exec_fault_m=
ode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) =
+19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_exec_threads@threads-bal-userptr-invalidate=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_exec_threads@threads-b=
al-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/=
shard-dg2-433/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
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
-xe/IGTPW_12513/shard-bmg-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard=
-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">In=
tel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_oa@non-privileged-access-va=
ddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-dg2-463/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#=
3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">=
Intel XE#979</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12513/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/s=
hard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://git=
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
3/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Inte=
l XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12513/shard-dg2-433/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
13/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel X=
E#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1251=
3/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel X=
E#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12513/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/sha=
rd-bmg-6/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/s=
hard-dg2-466/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#=
569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">=
Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#=
579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_125=
13/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2513/shard-dg2-463/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-dg2-433/igt@xe_query@multigpu-query-engines.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12513/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extensio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusi=
ve-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12513/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on=
-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-bmg-3/igt@xe_sriov_auto_provi=
sioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-=
on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_sriov_auto_p=
rovisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12513/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Inte=
l XE#3342</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12513/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE=
#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8214/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel =
XE#3075</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3084">Intel XE#3084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12513/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8214 -&gt; IGTPW_12513</li>
<li>Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -&gt; xe-2570-b=
dfc862a5c719d934efbdedb050ef891b9feef15</li>
</ul>
<p>IGTPW_12513: 12513<br />
  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc6=
09b9dd59ef1ffcd79<br />
  xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15: bdfc862a5c719d934efbded=
b050ef891b9feef15</p>

</body>
</html>

--===============3711999367969927863==--
