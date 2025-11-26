Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E67D1039B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 17:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C710E69E;
	Wed, 26 Nov 2025 17:49:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6110E69E;
 Wed, 26 Nov 2025 17:49:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6999505200032732776=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fpat=3A_Ad?=
 =?utf-8?q?d_subtest_to_validate_NO=5FCOMPRESSION_flag_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Nov 2025 17:49:05 -0000
Message-ID: <176417934548.31997.13160853921362143177@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126141634.309190-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251126141634.309190-2-sanjay.kumar.yadav@intel.com>
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

--===============6999505200032732776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: Add subtest to validate NO_COMPRESSION flag (rev2)
URL   : https://patchwork.freedesktop.org/series/156928/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8639_FULL -> XEIGTPW_14119_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14119_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14119_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14119_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [FAIL][2] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
    - shard-lnl:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  
New tests
---------

  New tests have been introduced between XEIGT_8639_FULL and XEIGTPW_14119_FULL:

### New IGT tests (1) ###

  * igt@xe_pat@bo-comp-disable-bind:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14119_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1125]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2233])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#623])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
    - shard-lnl:          NOTRUN -> [FAIL][8] ([Intel XE#6676]) +44 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#6678]) +5 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#664])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-lnl:          NOTRUN -> [FAIL][11] ([Intel XE#6677]) +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#3658]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#607])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1477])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +12 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1512])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +125 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#3432]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +25 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +19 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2907])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +21 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2724])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#4418])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4418])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2325]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#306]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2252]) +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2341])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@kms_content_protection@mei-interface.html
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1468])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#3278]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424]) +11 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2291])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#323])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2286])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1508])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1340])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4354])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4331])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4331])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4331])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2244])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2244])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4422])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#4422])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2316]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2316])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1397] / [Intel XE#1745]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1397]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][77] ([Intel XE#4683]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1401]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#352])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#651]) +20 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2311]) +40 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4141]) +20 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6312]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651]) +34 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#653]) +41 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2313]) +38 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2312]) +13 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1158])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2350])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#6312]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#656]) +69 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1470] / [Intel XE#2853])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [PASS][95] -> [ABORT][96] ([Intel XE#6662])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][97] ([Intel XE#6662])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1503]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1450]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2925] / [Intel XE#346])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#356])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#5624])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [FAIL][104] ([Intel XE#5195]) +2 other tests fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#599]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2393])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4596])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#5020])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#5020])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#6691]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#6691]) +18 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#736])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][113] ([Intel XE#718])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#718])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1439] / [Intel XE#836])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          NOTRUN -> [ABORT][117] ([Intel XE#6675]) +10 other tests abort
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1406] / [Intel XE#2893]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406] / [Intel XE#4608]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#1406] / [Intel XE#2387])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1122] / [Intel XE#1406])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1128] / [Intel XE#1406])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406] / [Intel XE#4609]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1406]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][130] ([Intel XE#2625] / [Intel XE#6675]) +1 other test abort
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][132] ([Intel XE#4689])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1127])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#3414]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2413]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1435]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1435])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#6503]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#455]) +21 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1499]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1499])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1091] / [Intel XE#2849])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1091] / [Intel XE#2849])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1447])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#6599])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_compute@eu-busy-10s.html
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#6592] / [Intel XE#6645])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_compute@eu-busy-10s.html

  * igt@xe_compute@loop-duration-2s:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#6598]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_compute@loop-duration-2s.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#6360])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1123]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-matrix-copy-2x2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#5300])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_copy_basic@mem-matrix-copy-2x2.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1126]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#5626])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#4837]) +25 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#4837]) +15 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4837]) +20 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][157] ([Intel XE#6321] / [Intel XE#6606])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#688]) +13 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2322]) +13 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1392]) +14 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#288]) +23 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][162] ([Intel XE#6299])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#5007]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#5007]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#4943]) +28 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#6196]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#4915]) +353 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#4943]) +37 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#255])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194]) -> ([PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [SKIP][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220]) ([Intel XE#378])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-3/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-1/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-1/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-3/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245]) -> ([PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [SKIP][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271]) ([Intel XE#2457])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-4/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-4/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-7/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-7/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295]) -> ([SKIP][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320]) ([Intel XE#378])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-436/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-466/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-432/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-432/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-435/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-432/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-435/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-436/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-436/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-435/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-463/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-463/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-463/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-466/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-433/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-433/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-433/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][321] ([Intel XE#3573]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@tail-address-wrap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][322] ([Intel XE#6032])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_oa@tail-address-wrap.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][323] ([Intel XE#1337])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][324] ([Intel XE#1061])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][325] ([Intel XE#6566])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][326] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][327] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
    - shard-bmg:          NOTRUN -> [SKIP][328] ([Intel XE#2284])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][329] ([Intel XE#1948])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          NOTRUN -> [ABORT][330] ([Intel XE#6675]) +9 other tests abort
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][331] ([Intel XE#6675]) +10 other tests abort
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][332] ([Intel XE#584]) +5 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][333] -> [ABORT][334] ([Intel XE#6675]) +1 other test abort
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-466/igt@xe_pm@s4-vm-bind-userptr.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][335] ([Intel XE#4733]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][336] ([Intel XE#4733]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][337] ([Intel XE#944]) +6 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#944]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#944]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     NOTRUN -> [SKIP][340] ([Intel XE#4130])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][341] ([Intel XE#4130])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][342] ([Intel XE#3342])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][343] ([Intel XE#4351])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-lnl:          NOTRUN -> [SKIP][344] ([Intel XE#4351])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][345] ([Intel XE#2291]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][347] ([Intel XE#3009]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_dp_aux_dev.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][349] ([Intel XE#301]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [ABORT][351] ([Intel XE#6675]) -> [PASS][352] +2 other tests pass
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [INCOMPLETE][353] ([Intel XE#4842]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [WARN][355] ([Intel XE#5786]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][357] ([Intel XE#2312]) -> [SKIP][358] ([Intel XE#2311])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][359] ([Intel XE#2311]) -> [SKIP][360] ([Intel XE#2312]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][361] ([Intel XE#2312]) -> [SKIP][362] ([Intel XE#4141]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][363] ([Intel XE#2313]) -> [SKIP][364] ([Intel XE#2312])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][365] ([Intel XE#2312]) -> [SKIP][366] ([Intel XE#2313]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6598]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6598
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#6662]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662
  [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6677
  [Intel XE#6678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6678
  [Intel XE#6691]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6691
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8639 -> IGTPW_14119
  * Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -> xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b

  IGTPW_14119: ef1ed1ef7dfc794c8168ab6c4a351ded8c81800d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca6fe1c3522c6ddc86b
  xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b: 3736d8f8cd5565a7146345cbdf103a4dcff5e55b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/index.html

--===============6999505200032732776==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: Add subtest to validate =
NO_COMPRESSION flag (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156928/">https://patchwork.freedesktop.org/series/156928/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14119/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14119/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8639_FULL -&gt; XEIGTPW_14119_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14119_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14119_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
119_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_content_protection@uevent.=
html">FAIL</a> +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_content_protection@uevent.ht=
ml">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8639_FULL and XEIGTPW_14119=
_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_pat@bo-comp-disable-bind:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14119_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"=
>Intel XE#1125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-=
1-linear-rgb565:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_async_flips@basic-modeset-wi=
th-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Intel XE#6676=
</a>) +44 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_async_flips@invalid-async-fl=
ip@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6678">Intel XE#6678</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_async_flips@test-cursor-atom=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_async_flips@test-time-stamp.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6677">Intel XE#6677</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@kms_bw@connected-linear-tiling=
-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_bw@linear-tiling-1-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Inte=
l XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">In=
tel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_cdclk@mode-transition-all-=
outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4418">Intel XE#4418</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable=
-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424">Intel XE#1424</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg=
-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_force_connector_basic@prune-=
stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +40 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +34 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +41 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +38 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1=
p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +69 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/i=
gt@kms_hdr@bpc-switch-dpms.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6662">Intel XE#6662</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms@pipe-a-d=
p-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6662">Intel XE#6662</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@=
pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@=
pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2925">Intel XE#2925</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_plane@pixel-format-source-cl=
amping@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
93">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6691">Intel XE#6691</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6691">Intel XE#6691</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@k=
ms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modese=
t.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6675">Intel XE#6675</a>) +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-blt@edp=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4609">Intel XE#4609</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@kms_psr@psr-suspend@edp-1.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
625">Intel XE#2625</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled=
-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip=
</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@kms_rotation_crc@sprite-rotati=
on-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@kms_sharpness_filter@filter-modi=
fiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kern=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_compute@eu-busy-10s.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599"=
>Intel XE#6599</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_compute@eu-busy-10s.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592"=
>Intel XE#6592</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6645">Intel XE#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@loop-duration-2s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_compute@loop-duration-2s.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6598">Intel XE#6598</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-=
0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-matrix-copy-2x2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_copy_basic@mem-matrix-copy-=
2x2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0=
x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_eudebug_online@debugger-reo=
pen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-t=
hreads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6606">Intel XE#6606</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_exec_basic@multigpu-once-user=
ptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_exec_fault_mode@twice-userp=
tr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_exec_reset@long-spin-comp-r=
euse-many-preempt-threads.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6299">Intel XE#6299</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_exec_system_allocator@many-64=
k-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_exec_system_allocator@many-64=
k-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_exec_system_allocator@many-ex=
ecqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +28 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_exec_system_allocator@threa=
ds-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +353 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-=
nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_exec_system_allocator@threads=
-shared-vm-many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +=
37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8639/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8639/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8639/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8639/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
639/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8639/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8639/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14119/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/s=
hard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14119/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-5/igt@xe_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1411=
9/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14119/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14119/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shar=
d-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4119/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8639/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8639/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
639/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8639/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8639/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/s=
hard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14119/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14119/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1411=
9/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14119/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14119/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/i=
gt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4119/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14119/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14119/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Int=
el XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8639/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8639/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8639/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-=
dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8639/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-436/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8639/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8639/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_863=
9/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-466/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8639/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8639/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@=
xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1411=
9/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14119/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/sha=
rd-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-466/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14119/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg=
2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4119/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14119/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14119/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shar=
d-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-436/igt@xe_module_load@lo=
ad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_oa@syncs-syncobj-cfg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@tail-address-wrap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_oa@tail-address-wrap.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/60=
32">Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_pat@display-vs-wb-transient=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_pm@s2idle-multiple-execs.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6675">Intel XE#6675</a>) +9 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675"=
>Intel XE#6675</a>) +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-8/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-dg2-466/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-dg2-=
436/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +1 other tes=
t abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-3/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-434/igt@xe_sriov_auto_provisioning@exc=
lusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14119/shard-lnl-7/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14119/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-ato=
mic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-2/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bm=
g-5/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14119/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">In=
tel XE#6675</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14119/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html">PASS<=
/a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4842">Intel XE#4842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14119/shard-dg2-435/igt@xe_exec_basic@multigpu-no-e=
xec-bindexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-pref=
etch.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5786">Intel XE#5786</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@xe_exec_system_allocator@many=
-stride-malloc-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8639/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14119/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other t=
ests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8639 -&gt; IGTPW_14119</li>
<li>Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -&gt; xe-4152-3=
736d8f8cd5565a7146345cbdf103a4dcff5e55b</li>
</ul>
<p>IGTPW_14119: ef1ed1ef7dfc794c8168ab6c4a351ded8c81800d @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca=
6fe1c3522c6ddc86b<br />
  xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b: 3736d8f8cd5565a7146345c=
bdf103a4dcff5e55b</p>

</body>
</html>

--===============6999505200032732776==--
