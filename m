Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0031BE7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 18:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8507310E459;
	Fri, 13 Dec 2024 18:12:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34E10E44F;
 Fri, 13 Dec 2024 18:12:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5030899522070964752=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/xe=5Fspin=5Fbatch=3A?=
 =?utf-8?q?_Add_spin-timestamp-check_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 18:12:10 -0000
Message-ID: <173411353036.2222702.9935360929415032090@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213083730.642423-1-pravalika.gurram@intel.com>
In-Reply-To: <20241213083730.642423-1-pravalika.gurram@intel.com>
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

--===============5030899522070964752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_spin_batch: Add spin-timestamp-check (rev9)
URL   : https://patchwork.freedesktop.org/series/140933/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8154_full -> XEIGTPW_12311_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12311_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12311_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12311_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-idle:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-1/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_drm_fdinfo@utilization-single-idle:
    - shard-bmg:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_drm_fdinfo@utilization-single-idle.html

  
#### Warnings ####

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-WARN][9] ([Intel XE#3467]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  
New tests
---------

  New tests have been introduced between XEIGT_8154_full and XEIGTPW_12311_full:

### New IGT tests (6) ###

  * igt@xe_spin_batch@spin-timestamp-check:
    - Statuses : 3 pass(s)
    - Exec time: [5.79, 8.08] s

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_compute:
    - Statuses : 3 pass(s)
    - Exec time: [1.14, 1.15] s

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_copy:
    - Statuses : 3 pass(s)
    - Exec time: [1.15] s

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_render:
    - Statuses : 3 pass(s)
    - Exec time: [1.17, 1.18] s

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_decode:
    - Statuses : 3 pass(s)
    - Exec time: [1.16, 2.31] s

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance:
    - Statuses : 3 pass(s)
    - Exec time: [1.14, 2.30] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12311_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3467] / [Intel XE#3468])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1727]) +9 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@fbdev@write.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1125])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][16] ([Intel XE#3781])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2385])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3658])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#3468]) +8 other tests dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#610])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2907]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +39 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +136 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2724])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#314]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#314]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1152]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-2/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#306]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2325])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#1178]) +3 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#3407])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-5.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][54] ([Intel XE#3468]) +1 other test incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][55] ([Intel XE#3468]) +2 other tests dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][56] ([Intel XE#3468]) +1 other test dmesg-warn
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][57] ([Intel XE#3468])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2286]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#323])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2291])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2291]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][64] ([Intel XE#3226])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [PASS][65] -> [FAIL][66] ([Intel XE#1475])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#3070])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2244]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1138])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][73] ([Intel XE#3468]) +19 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#2882]) +3 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#3321]) +2 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2316]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#301]) +6 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][81] -> [DMESG-FAIL][82] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][83] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][84] ([Intel XE#3468])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][85] -> [DMESG-FAIL][86] ([Intel XE#3468])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][87] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#886]) +3 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][90] -> [INCOMPLETE][91] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2293]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1401] / [Intel XE#1745])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1401])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2311]) +17 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#651]) +33 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2312]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][99] ([Intel XE#1727])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#2333]) +8 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#651]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#656]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#653]) +32 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2313]) +16 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1503])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle@pipe-a-dp-2:
    - shard-bmg:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#1727]) +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_hdr@static-toggle@pipe-a-dp-2.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-dp-2.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#3012])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#356])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][111] ([Intel XE#2705]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][112] -> [INCOMPLETE][113] ([Intel XE#1727]) +3 other tests incomplete
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2493])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][115] -> [FAIL][116] ([Intel XE#361])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][117] -> [DMESG-WARN][118] ([Intel XE#2705] / [Intel XE#3468])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2763]) +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2763]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#870])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1122]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#718])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1129])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#2029])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][130] ([Intel XE#1727] / [Intel XE#2042] / [Intel XE#3468])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][131] -> [DMESG-WARN][132] ([Intel XE#1727] / [Intel XE#2042] / [Intel XE#3468])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@universal-planes.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][133] -> [DMESG-WARN][134] ([Intel XE#2042] / [Intel XE#3468])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3468]) +8 other tests dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-bmg:          [PASS][137] -> [DMESG-WARN][138] ([Intel XE#1727] / [Intel XE#3468]) +8 other tests dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     [PASS][139] -> [DMESG-WARN][140] ([Intel XE#1727] / [Intel XE#3468]) +9 other tests dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@universal-planes@plane-59.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2893]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1489]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#1489]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1128])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2387])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2850] / [Intel XE#929]) +18 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1406])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-3/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2234])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2939])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2330])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#3414])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#3414]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1435])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1435])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-bmg:          [PASS][156] -> [SKIP][157] ([Intel XE#1435])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#330])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][159] -> [INCOMPLETE][160] ([Intel XE#1034] / [Intel XE#1727]) +1 other test incomplete
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-6.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#455]) +23 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_vrr@flipline.html
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#1499])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1499])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][164] -> [FAIL][165] ([Intel XE#1522]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-5/igt@kms_vrr@max-min.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-7/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#756])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#756])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1126]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#2905]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-3/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2905]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][171] ([Intel XE#1473] / [Intel XE#3468])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][172] ([Intel XE#1473])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#688]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2322]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1392]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#288]) +24 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#2905]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][178] -> [DMESG-WARN][179] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][180] ([Intel XE#3467]) +1 other test dmesg-warn
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][181] -> [SKIP][182] ([Intel XE#1192])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][183] ([Intel XE#1999]) +2 other tests fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208]) -> ([PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [SKIP][232], [PASS][233], [PASS][234]) ([Intel XE#378])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][235] ([Intel XE#3467] / [Intel XE#3468])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][236] -> [DMESG-WARN][237] ([Intel XE#3467])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@reload.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [PASS][238] -> [DMESG-WARN][239] ([Intel XE#3467])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@xe_module_load@unload.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_module_load@unload.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#2541] / [Intel XE#3573]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#977])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [PASS][242] -> [DMESG-WARN][243] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_pm@s3-basic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_pm@s3-basic.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][244] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][245] -> [DMESG-WARN][246] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][247] -> [DMESG-FAIL][248] ([Intel XE#1727] / [Intel XE#3468])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#944]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#944]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#3342])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][252] -> [DMESG-WARN][253] ([Intel XE#3468]) +53 other tests dmesg-warn
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [PASS][254] -> [DMESG-WARN][255] ([Intel XE#2919])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][256] -> [ABORT][257] ([Intel XE#3084] / [Intel XE#3468])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][258] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][260] ([Intel XE#3719]) -> [PASS][261] +3 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][262] ([Intel XE#1426]) -> [PASS][263] +3 other tests pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][264] ([Intel XE#2705]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_color@degamma@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][266] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][267] +1 other test pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_color@degamma@pipe-a-dp-2.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_color@degamma@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [DMESG-FAIL][268] ([Intel XE#3468]) -> [PASS][269] +18 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][270] ([Intel XE#2291]) -> [PASS][271] +2 other tests pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][272] ([Intel XE#3321]) -> [PASS][273] +1 other test pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][274] ([Intel XE#301]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][276] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][277] +6 other tests pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][278] ([Intel XE#3468]) -> [PASS][279] +75 other tests pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][280] ([Intel XE#2316]) -> [PASS][281] +3 other tests pass
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][282] ([Intel XE#2882]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [DMESG-FAIL][284] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][285] +6 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [DMESG-WARN][286] ([Intel XE#1727]) -> [PASS][287] +15 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [INCOMPLETE][288] -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [DMESG-WARN][290] ([Intel XE#1727]) -> [PASS][291] +6 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [INCOMPLETE][292] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#3663]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [INCOMPLETE][294] ([Intel XE#1035] / [Intel XE#2566] / [Intel XE#3468]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [INCOMPLETE][296] ([Intel XE#1035] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-dg2-set2:     [INCOMPLETE][298] ([Intel XE#1035] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [INCOMPLETE][300] ([Intel XE#1727]) -> [PASS][301] +3 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [INCOMPLETE][302] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][303] +1 other test pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [DMESG-WARN][304] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][305] +4 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][306] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][308] ([Intel XE#1435]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [INCOMPLETE][310] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][311] +3 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_ccs@suspend-resume.html
    - shard-dg2-set2:     [INCOMPLETE][312] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-dg2-set2:     [DMESG-WARN][314] ([Intel XE#3468]) -> [PASS][315] +4 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [INCOMPLETE][316] -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [INCOMPLETE][318] -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
    - shard-dg2-set2:     [DMESG-FAIL][320] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][321] +4 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [DMESG-WARN][322] ([Intel XE#3467]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][324] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][325] +2 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][326] ([Intel XE#2998]) -> [PASS][327] +1 other test pass
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_mmap@system:
    - shard-bmg:          [DMESG-WARN][328] -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_mmap@system.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@xe_mmap@system.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][330] ([Intel XE#3467]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [DMESG-WARN][332] ([Intel XE#1616] / [Intel XE#3468]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@xe_pm@s2idle-multiple-execs.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][334] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][336] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-dg2-set2:     [DMESG-WARN][338] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-dg2-set2:     [DMESG-WARN][340] ([Intel XE#1727] / [Intel XE#358]) -> [PASS][341] +2 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [DMESG-WARN][342] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][343] ([Intel XE#3468])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#316]) -> [INCOMPLETE][345] ([Intel XE#1727] / [Intel XE#402])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [INCOMPLETE][346] ([Intel XE#3225]) -> [INCOMPLETE][347] ([Intel XE#1727] / [Intel XE#3225])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][348] ([Intel XE#1727]) -> [INCOMPLETE][349] ([Intel XE#1727] / [Intel XE#2705])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][350] ([Intel XE#2715] / [Intel XE#3468]) -> [FAIL][351] ([Intel XE#1178]) +1 other test fail
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][352] ([Intel XE#1188]) -> [SKIP][353] ([Intel XE#2341])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_content_protection@uevent.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][354] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][355] ([Intel XE#877])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][356] ([Intel XE#2333]) -> [SKIP][357] ([Intel XE#2312]) +7 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][358] ([Intel XE#2312]) -> [DMESG-FAIL][359] ([Intel XE#3468])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][360] ([Intel XE#2333]) -> [DMESG-FAIL][361] ([Intel XE#3468]) +1 other test dmesg-fail
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][362] ([Intel XE#2312]) -> [FAIL][363] ([Intel XE#2333]) +4 other tests fail
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][364] ([Intel XE#3468]) -> [FAIL][365] ([Intel XE#2333]) +12 other tests fail
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][366] ([Intel XE#3468]) -> [SKIP][367] ([Intel XE#2312]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][368] ([Intel XE#2311]) -> [SKIP][369] ([Intel XE#2312]) +12 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][370] ([Intel XE#2312]) -> [SKIP][371] ([Intel XE#2311]) +9 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][372] ([Intel XE#2312]) -> [SKIP][373] ([Intel XE#2313]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][374] ([Intel XE#2313]) -> [SKIP][375] ([Intel XE#2312]) +15 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][376] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][377] ([Intel XE#1727]) +1 other test incomplete
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1500]) -> [SKIP][379] ([Intel XE#362])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [DMESG-WARN][380] ([Intel XE#3468]) -> [SKIP][381] ([Intel XE#1499])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][382] ([Intel XE#1473]) -> [TIMEOUT][383] ([Intel XE#1473])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
    - shard-bmg:          [INCOMPLETE][384] ([Intel XE#1473]) -> [TIMEOUT][385] ([Intel XE#1473])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][386] ([Intel XE#1473]) -> [INCOMPLETE][387] ([Intel XE#1473])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [FAIL][388] ([Intel XE#1000]) -> [TIMEOUT][389] ([Intel XE#1473] / [Intel XE#2472]) +1 other test timeout
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-WARN][390] ([Intel XE#3467]) -> [DMESG-WARN][391] ([Intel XE#3467] / [Intel XE#3468])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][392] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][393] ([Intel XE#3467])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][394] ([Intel XE#1192]) -> [SKIP][395] ([Intel XE#2833])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8154 -> IGTPW_12311
  * Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -> xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3

  IGTPW_12311: 7c13c2312174860e7f8e0ea137ebcbdda43bbdbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662bfc451bc232c5d24cc
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be46262724a61ae951e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/index.html

--===============5030899522070964752==
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
<tr><td><b>Series:</b></td><td>tests/xe_spin_batch: Add spin-timestamp-chec=
k (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/140933/">https://patchwork.freedesktop.org/series/140933/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12311/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12311/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8154_full -&gt; XEIGTPW_12311_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12311_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12311_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
311_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@xe_drm_fdinfo@parallel-utilization-single-idle=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12311/shard-dg2-433/igt@xe_drm_fdinfo@parallel-utilization-single-idl=
e.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-1/igt@xe_drm_fdinfo@utilization-others-full-load.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12311/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL=
</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-idle.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311=
/shard-bmg-5/igt@xe_drm_fdinfo@utilization-single-idle.html">FAIL</a> +2 ot=
her tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@reload-no-display:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
7">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@reload-no-display.html">=
INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8154_full and XEIGTPW_12311=
_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.79, 8.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_comput=
e:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.14, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_copy:<=
/p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_render=
:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.17, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_=
decode:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.16, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_=
enhance:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.14, 2.30] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12311_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-=
463/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@fbdev@write.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@fbdev=
@write.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"=
>Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hdmi-=
a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3781">Intel XE#3781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/sh=
ard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +136 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
24">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-2/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@kms_chamelium_color@gamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
25">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_content_protection@atomic@=
pipe-a-dp-5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3407">Intel XE#3407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pi=
pe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@=
pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pi=
pe-d-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2311/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2311/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">In=
tel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311=
/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3=
070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +19 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12311/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12311/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-inter=
ruptible@a-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-inter=
ruptible@b-dp4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-=
a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-hd=
mi-a6.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@flip-vs-suspend-inter=
ruptible@c-dp4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other te=
sts dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1231=
1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-=
xtile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32b=
pp-xtile-to-64bpp-xtile-downscaling.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +33 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +8 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +32 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-2/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_hdr@static-toggle@pipe-a-dp-2.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/sha=
rd-bmg-8/igt@kms_hdr@static-toggle@pipe-a-dp-2.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/sha=
rd-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-s=
anitycheck-nv12@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other tes=
t dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-h=
dmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12311/shard-dg2-463/igt@kms_plane_alpha_blend@alpha-opaque-fb@=
pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12311/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pi=
pe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with=
-pixel-format@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_plane_scaling@plane-ups=
cale-factor-0-25-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_pm_backlight@basic-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-7/igt@k=
ms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_pm_rpm@system-suspend-mode=
set.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-d=
g2-466/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel =
XE#2042</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/sh=
ard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2=
042</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12311/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2311/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@universal-planes@plane-59.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1231=
1/shard-dg2-466/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">In=
tel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1128">Intel XE#1128</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-3/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_psr@psr-sprite-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@kms_rotation_crc@sprite-rotati=
on-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-4/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311=
/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_tv_load_detect@load-detect=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hd=
mi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12311/shard-dg2-435/igt@kms_vblank@ts-continuation-idle-hang@pi=
pe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other tes=
t incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +23 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel=
 XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-5/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-5/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-7/igt@kms_v=
rr@max-min.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-3/igt@xe_eudebug@basic-vm-bind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@xe_eudebug_online@single-step-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@xe_evict@evict-beng-mixed-thread=
s-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_evict@evict-mixed-many-thre=
ads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-st=
andalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint=
-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_fault_injection@vm-bind-fai=
l-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/=
igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-=
dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8154/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-43=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_815=
4/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8154/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shar=
d-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12311/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2=
-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
311/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12311/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shar=
d-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_module_load@lo=
ad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12311/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_module_load@many-reload.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436=
/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@xe_module_load@unload.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt=
@xe_module_load@unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_oa@whitelisted-registers-us=
erspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">=
Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_pm@=
s3-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_pm@s3-basic.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-4=
34/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">=
Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-7=
/igt@xe_pm_residency@cpg-basic.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@xe_query@multigpu-query-topolo=
gy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-time=
out.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12311/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-=
timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) +53 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/ig=
t@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bm=
g-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467=
">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@core_hotunplug@hotunbind-r=
ebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12311/shard-lnl-8/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-trans=
ition@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-lnl-2/igt@kms_atomic_tran=
sition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +3 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@=
pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_ccs@crc-=
sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_color@degamma@pipe-a-dp-2.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_color@degamma@pipe-a-dp-2.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x25=
6.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12311/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legac=
y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2=
-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_f=
lip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +6 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2=
-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_flip@2x-flip-vs=
-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +75 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel =
XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12311/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">PASS</=
a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-upscaling.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_flip_s=
caled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +15 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-=
shrfb-draw-blt.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12311/shard-lnl-6/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12311/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html">=
PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3663">Intel XE#3663</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_pipe_crc=
_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@kms_plane=
@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@k=
ms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pa=
ss</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt=
@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-wi=
th-modifiers.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@kms_plane_sca=
ling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> +3 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset=
-lpsp.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2864">Intel XE#2864</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_pm_rpm@=
modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12311/shard-bmg-5/igt@xe_ccs@suspend-resume.html">PASS</a> +3 =
other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE=
#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@suspend-resume.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@linear-compressed-compfm=
t0-system-vram01.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@su=
spend-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> +4 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt=
0-vram01-vram01.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_ccs@suspend-resume@ti=
le4-compressed-compfmt0-vram01-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0=
-system-vram01.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_ccs@suspend-resume@xmajo=
r-compressed-compfmt0-system-vram01.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@xmajor-compressed-compfm=
t0-system-vram01.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433=
/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html">P=
ASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_exec_queu=
e_create_bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-435/igt@xe_fault_inj=
ection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_fault_inject=
ion@vm-create-fail-xe_pt_create.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2998">Intel XE#2998</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12311/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kuni=
t.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_mmap@system.html">DMESG-WARN</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@=
xe_mmap@system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@xe_module_load@reload-no-display.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"=
>Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12311/shard-bmg-6/igt@xe_module_load@reload-no-display.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Inte=
l XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12311/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#16=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/179=
4">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12311/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2280">Intel XE#2280</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-5/igt@xe_pm@s4-vm-bind-unb=
ind-all.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">In=
tel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2280">Intel XE#2280</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-436/igt@xe_pm@s4-vm-bind=
-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-ti=
meout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-433/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +2 other tests p=
ass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fenci=
ng.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_atomic_=
transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12311/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
25">Intel XE#3225</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12311/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12311/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_content_pro=
tection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12311/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-pgflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 oth=
er test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-plflip-blt.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-2/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-6/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdm=
i-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12311/shard-dg2-463/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_vrr@negative-basic.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12311/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12311/shard-dg2-466/igt@xe_evict@evict-beng-mixed-m=
any-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12311/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-=
threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">I=
ntel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12311/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#=
1000</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12311/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#14=
73</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/247=
2">Intel XE#2472</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_execute.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@xe_fault_injection=
@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_=
create_bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12311/shard-bmg-8/igt@x=
e_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">=
Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1231=
1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8154 -&gt; IGTPW_12311</li>
<li>Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -&gt; xe-2368-a=
4502e763bb931b68fa9be46262724a61ae951e3</li>
</ul>
<p>IGTPW_12311: 7c13c2312174860e7f8e0ea137ebcbdda43bbdbb @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662b=
fc451bc232c5d24cc<br />
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be4=
6262724a61ae951e3</p>

</body>
</html>

--===============5030899522070964752==--
