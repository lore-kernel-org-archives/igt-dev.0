Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99464D116E9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 02:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991B10E737;
	Thu, 27 Nov 2025 02:49:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94D10E01F;
 Thu, 27 Nov 2025 02:49:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5899450083901846423=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2Cv2=2C1/6=5D_lib/amdgpu=3A_Add_flexible_command_context_API_?=
 =?utf-8?q?with_external_BO_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Nov 2025 02:49:15 -0000
Message-ID: <176421175542.32692.3841882175922304627@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
In-Reply-To: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
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

--===============5899450083901846423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/6] lib/amdgpu: Add flexible command context API with external BO support
URL   : https://patchwork.freedesktop.org/series/158141/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8639_FULL -> XEIGTPW_14121_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14121_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14121_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14121_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
    - shard-lnl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  
#### Warnings ####

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][4] ([Intel XE#6675]) -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html

  
New tests
---------

  New tests have been introduced between XEIGT_8639_FULL and XEIGTPW_14121_FULL:

### New IGT tests (1) ###

  * igt@xe_gpgpu_fill@offset-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14121_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1125]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2233])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#623])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1466])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
    - shard-lnl:          NOTRUN -> [FAIL][10] ([Intel XE#6676]) +51 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#664])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-lnl:          NOTRUN -> [FAIL][12] ([Intel XE#6677]) +5 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2370])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3658]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +11 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +27 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#607])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +19 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2328])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#619])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +20 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1512]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#367]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#367]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2669]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +45 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +23 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3432]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2907])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +160 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +29 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2724])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4418])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#4418])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4416]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2325]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252]) +11 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +19 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2341])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1178]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2390]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#307]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#307]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3278]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2321]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#308]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2320]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2321]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1424]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2291])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#309]) +12 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1340]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#4354]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4294])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#4331])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4331])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2244]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2244]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4422]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4422])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4422])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2374])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1135])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2316]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2316]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1421]) +14 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#301]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1397] / [Intel XE#1745]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1397]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1401]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#352]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#651]) +30 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4141]) +16 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#6312]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#651]) +36 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2312]) +16 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2311]) +32 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#658])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1469]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2352])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#653]) +35 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +33 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656]) +82 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1470] / [Intel XE#2853])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [PASS][103] -> [ABORT][104] ([Intel XE#6662])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_hdr@bpc-switch.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#455]) +25 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1503])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2934])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2925])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2925])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2501])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#5624])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#599]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#4596])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#5020])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#5020])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#5020])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#6691]) +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#6691]) +14 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#736])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][120] ([Intel XE#2029])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1439] / [Intel XE#836])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1439] / [Intel XE#3141])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          NOTRUN -> [ABORT][124] ([Intel XE#6675]) +11 other tests abort
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406] / [Intel XE#4608]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406] / [Intel XE#2893]) +9 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1406] / [Intel XE#4609]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +22 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1406]) +13 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][134] ([Intel XE#2625] / [Intel XE#6675]) +1 other test abort
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1406] / [Intel XE#2414]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#3414])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#3414] / [Intel XE#3904])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][138] ([Intel XE#4689])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1127]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2330])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2413]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1435]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#6503]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#330])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#330])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2450])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1499])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][149] ([Intel XE#6390]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-bmg:          NOTRUN -> [ABORT][150] ([Intel XE#6662]) +3 other tests abort
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1447])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#6599]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@xe_compute@eu-busy-10s.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#6598])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_compute@eu-busy-10s.html
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#6592] / [Intel XE#6645])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_compute@eu-busy-10s.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#5191])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1126]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#4837]) +13 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4837]) +13 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#4837]) +24 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#688]) +17 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1392]) +18 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2322]) +11 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#288]) +40 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][164] ([Intel XE#6299])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:
    - shard-lnl:          NOTRUN -> [WARN][165] ([Intel XE#5786]) +2 other tests warn
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_exec_system_allocator@madvise-split-vma-with-mapping.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#5007])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#5007])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#4943]) +34 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#4943]) +41 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#6196])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#4915]) +382 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][172] ([Intel XE#5466])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-lnl:          NOTRUN -> [ABORT][173] ([Intel XE#5466])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          NOTRUN -> [ABORT][174] ([Intel XE#5466] / [Intel XE#5530])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          NOTRUN -> [ABORT][175] ([Intel XE#4757])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#2229])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2229])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2833])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#2833])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#5100]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#3573]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#6032])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#2248])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#2248])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#1420])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2838] / [Intel XE#979])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#1420] / [Intel XE#2838])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#1061]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#6566])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#5694])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2284]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][194] ([Intel XE#6675]) +14 other tests abort
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#584]) +6 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][196] -> [ABORT][197] ([Intel XE#6675])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#579])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#579])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#579])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          NOTRUN -> [ABORT][201] ([Intel XE#6675]) +12 other tests abort
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][202] -> [FAIL][203] ([Intel XE#6251])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          NOTRUN -> [FAIL][204] ([Intel XE#6251]) +2 other tests fail
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#4733]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#4733]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#944]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#944]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#944]) +6 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][210] ([Intel XE#4814])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#4130])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#4130]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#4351])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@equal-throughput@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][214] ([Intel XE#5937]) +1 other test fail
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][215] ([Intel XE#2291]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][217] ([Intel XE#2373]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][219] ([Intel XE#2316]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][221] ([Intel XE#301]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [INCOMPLETE][223] ([Intel XE#4842]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [WARN][225] ([Intel XE#5786]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][227] ([Intel XE#2312]) -> [SKIP][228] ([Intel XE#4141]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][229] ([Intel XE#2311]) -> [SKIP][230] ([Intel XE#2312]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][231] ([Intel XE#2312]) -> [SKIP][232] ([Intel XE#2311])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][233] ([Intel XE#2313]) -> [SKIP][234] ([Intel XE#2312]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][235] ([Intel XE#2312]) -> [SKIP][236] ([Intel XE#2313]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6598]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6598
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#6662]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662
  [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6677
  [Intel XE#6691]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6691
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8639 -> IGTPW_14121
  * Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -> xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884

  IGTPW_14121: d88279081815a1a0689c961f0dade2e58cdfa6b0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca6fe1c3522c6ddc86b
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/index.html

--===============5899450083901846423==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/6] lib/amdgpu: Add flexible command context API with external BO support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158141/">https://patchwork.freedesktop.org/series/158141/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8639_FULL -&gt; XEIGTPW_14121_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14121_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14121_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14121_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s4-d3hot-basic-exec:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8639_FULL and XEIGTPW_14121_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_gpgpu_fill@offset-16x16:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14121_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>) +51 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6677">Intel XE#6677</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_hdr@bpc-switch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662">Intel XE#6662</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6691">Intel XE#6691</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6691">Intel XE#6691</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +11 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +22 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_psr@psr-suspend@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_sharpness_filter@filter-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@kms_vrr@lobf@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390">Intel XE#6390</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662">Intel XE#6662</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6598">Intel XE#6598</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592">Intel XE#6592</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299">Intel XE#6299</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_exec_system_allocator@madvise-split-vma-with-mapping.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) +2 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-464/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +382 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032">Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +14 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +12 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-433/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-466/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput@numvfs-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14121/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8639 -&gt; IGTPW_14121</li>
<li>Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -&gt; xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884</li>
</ul>
<p>IGTPW_14121: d88279081815a1a0689c961f0dade2e58cdfa6b0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca6fe1c3522c6ddc86b<br />
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884</p>

</body>
</html>

--===============5899450083901846423==--
