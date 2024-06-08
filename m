Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC69C25B76
	for <igt-dev@archiver.kernel.org>; Sat,  8 Jun 2024 14:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9110E094;
	Sat,  8 Jun 2024 14:10:24 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341F810E094;
 Sat,  8 Jun 2024 14:10:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3317548356768309831=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_Intel_Xe_OA_IGT=27s_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 08 Jun 2024 14:10:23 -0000
Message-ID: <171785582319.29541.8616525361025000279@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
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

--===============3317548356768309831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev3)
URL   : https://patchwork.freedesktop.org/series/130033/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7880_full -> XEIGTPW_11239_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11239_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11239_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11239_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1396 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * {igt@xe_oa@map-oa-buffer} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_oa@map-oa-buffer.html

  * {igt@xe_oa@stress-open-close} (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][4] +37 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_oa@stress-open-close.html

  * {igt@xe_query@multigpu-query-oa-units} (NEW):
    - {shard-lnl}:        NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [FAIL][6] +320 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_query@query-uc-fw-version-huc.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201] / [Intel XE#623]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [FAIL][9] ([Intel XE#827]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1201] / [Intel XE#873]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#316]) -> [FAIL][14] +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) -> [FAIL][16] +16 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#1201] / [Intel XE#607]) -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#1201] / [Intel XE#610]) -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#1124]) -> [FAIL][22] +6 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][23] ([Intel XE#1124] / [Intel XE#1201]) -> [FAIL][24] +50 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#1201] / [Intel XE#346]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_big_joiner@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][27] ([Intel XE#1201] / [Intel XE#367]) -> [FAIL][28] +12 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][29] ([Intel XE#367]) -> [FAIL][30] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][31] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [FAIL][32] +56 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][33] ([Intel XE#455] / [Intel XE#787]) -> [FAIL][34] +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][35] ([Intel XE#1201] / [Intel XE#1252]) -> [FAIL][36] +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][37] ([Intel XE#1201] / [Intel XE#314]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][39] ([Intel XE#306]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][41] ([Intel XE#1201] / [Intel XE#306]) -> [FAIL][42] +7 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_chamelium_color@degamma.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][43] ([Intel XE#373]) -> [FAIL][44] +4 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#1201] / [Intel XE#373]) -> [FAIL][46] +44 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][47] ([Intel XE#307]) -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][49] ([Intel XE#1201] / [Intel XE#307]) -> [FAIL][50] +3 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][51] ([Intel XE#1178]) -> [FAIL][52] +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@kms_content_protection@srm.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][53] ([Intel XE#1201] / [Intel XE#308]) -> [FAIL][54] +5 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256:
    - shard-dg2-set2:     [DMESG-WARN][55] ([Intel XE#282]) -> [FAIL][56] +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#455]) -> [FAIL][58] +3 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#308]) -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][61] ([Intel XE#1551]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [FAIL][64] +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#323]) -> [FAIL][66] +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][67] ([Intel XE#1214] / [Intel XE#282]) -> [FAIL][68] +25 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_cursor_legacy@single-move.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_cursor_legacy@single-move.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#776]) -> [FAIL][72] +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#1201] / [Intel XE#701]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201] / [Intel XE#703]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1138] / [Intel XE#1201]) -> [FAIL][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#1135] / [Intel XE#1201]) -> [FAIL][80] +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [INCOMPLETE][81] ([Intel XE#1195]) -> [FAIL][82] +2 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][83] ([Intel XE#1551]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [i915#5274]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#651]) -> [FAIL][88] +144 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [FAIL][89] ([Intel XE#616]) -> [FAIL][90] +3 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#658]) -> [FAIL][92] +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#651]) -> [FAIL][94] +13 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#1201] / [Intel XE#658]) -> [FAIL][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#653]) -> [FAIL][98] +147 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1158] / [Intel XE#1201]) -> [FAIL][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#653]) -> [FAIL][102] +15 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#605]) -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#356]) -> [FAIL][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][107] ([Intel XE#361]) -> [FAIL][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [FAIL][110] +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [FAIL][112] +5 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#870]) -> [FAIL][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#870]) -> [FAIL][116] +3 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1129] / [Intel XE#1201]) -> [FAIL][118] +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#908]) -> [FAIL][120] +1 other test fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1122] / [Intel XE#1201]) -> [FAIL][122] +4 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#929]) -> [FAIL][124] +7 other tests fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#929]) -> [FAIL][126] +91 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1149] / [Intel XE#1201]) -> [FAIL][128] +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rmfb@close-fd:
    - shard-dg2-set2:     [FAIL][129] ([Intel XE#294]) -> [FAIL][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_rmfb@close-fd.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_rmfb@close-fd.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#327]) -> [FAIL][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#327]) -> [FAIL][134] +8 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1127] / [Intel XE#1201]) -> [FAIL][136] +3 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#1500]) -> [FAIL][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#330]) -> [FAIL][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][144] +63 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_vrr@flipline.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#756]) -> [FAIL][146] +4 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#756]) -> [FAIL][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1091] / [Intel XE#1201]) -> [FAIL][150] +2 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#1050]) -> [FAIL][152] +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [FAIL][154] +1 other test fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1123]) -> [FAIL][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1123] / [Intel XE#1201]) -> [FAIL][158] +2 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1126] / [Intel XE#1201]) -> [FAIL][160] +2 other tests fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][161] ([Intel XE#1473] / [Intel XE#392]) -> [FAIL][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][163] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [FAIL][164] +1 other test fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][165] ([Intel XE#1473]) -> [FAIL][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#1600]) -> [FAIL][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#288]) -> [FAIL][170] +13 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#288]) -> [FAIL][172] +120 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#1638]) -> [FAIL][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#255]) -> [FAIL][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#560]) -> [FAIL][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_media_fill@media-fill.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#512]) -> [FAIL][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_mmap@small-bar.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#1214]) -> [FAIL][182] +7 other tests fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_module_load@reload.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#1337]) -> [FAIL][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#977]) -> [FAIL][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#979]) -> [FAIL][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#979]) -> [FAIL][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][191] ([Intel XE#1173]) -> [FAIL][192] +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_peer2peer@read.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#366]) -> [FAIL][194] +1 other test fail
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#366]) -> [FAIL][196] +4 other tests fail
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][197] ([Intel XE#1214] / [Intel XE#1551]) -> [FAIL][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][199] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941]) -> [FAIL][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#579]) -> [FAIL][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#944]) -> [FAIL][204] +12 other tests fail
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#944]) -> [FAIL][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][207] ([Intel XE#1214] / [Intel XE#1760]) -> [FAIL][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_wedged@basic-wedged.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-FAIL][209] ([Intel XE#1760]) -> [FAIL][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_getversion@all-cards}:
    - shard-dg2-set2:     [PASS][211] -> [FAIL][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@core_getversion@all-cards.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind:
    - {shard-lnl}:        [DMESG-WARN][213] ([Intel XE#2016]) -> [FAIL][214] +8 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@core_hotunplug@hotrebind.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@core_hotunplug@hotrebind.html

  * igt@intel_hwmon@hwmon-read:
    - {shard-lnl}:        [SKIP][215] ([Intel XE#1125]) -> [FAIL][216] +1 other test fail
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@intel_hwmon@hwmon-read.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_3d:
    - {shard-lnl}:        [SKIP][217] ([Intel XE#1465]) -> [FAIL][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_3d.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - {shard-lnl}:        [SKIP][219] ([Intel XE#1466]) -> [FAIL][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - {shard-lnl}:        [SKIP][221] ([Intel XE#660]) -> [FAIL][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@no-handle:
    - {shard-lnl}:        NOTRUN -> [FAIL][223] +693 other tests fail
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_addfb_basic@no-handle.html

  * igt@kms_async_flips@invalid-async-flip:
    - {shard-lnl}:        [SKIP][224] ([Intel XE#873]) -> [FAIL][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_async_flips@invalid-async-flip.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - {shard-lnl}:        [SKIP][226] ([Intel XE#664]) -> [FAIL][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_async_flips@test-cursor.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-lnl}:        [FAIL][228] ([Intel XE#1659]) -> [FAIL][229] +1 other test fail
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - {shard-lnl}:        [SKIP][230] ([Intel XE#1407]) -> [FAIL][231] +18 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - {shard-lnl}:        [DMESG-WARN][232] ([Intel XE#1725]) -> [FAIL][233] +1 other test fail
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - {shard-lnl}:        [SKIP][234] ([Intel XE#1124]) -> [FAIL][235] +48 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - {shard-lnl}:        [SKIP][236] ([Intel XE#1428]) -> [FAIL][237] +1 other test fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - {shard-lnl}:        [SKIP][238] ([Intel XE#1467]) -> [FAIL][239] +1 other test fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - {shard-lnl}:        [SKIP][240] ([Intel XE#1477]) -> [FAIL][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@basic:
    - {shard-lnl}:        [SKIP][242] ([Intel XE#346]) -> [FAIL][243] +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_big_joiner@basic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - {shard-lnl}:        [SKIP][244] ([Intel XE#367]) -> [FAIL][245] +6 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - {shard-lnl}:        [SKIP][246] ([Intel XE#1512]) -> [FAIL][247] +1 other test fail
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - {shard-lnl}:        [SKIP][248] ([Intel XE#1399]) -> [FAIL][249] +65 other tests fail
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - {shard-lnl}:        [SKIP][250] ([Intel XE#1446] / [Intel XE#314]) -> [FAIL][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_cdclk@mode-transition.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - {shard-lnl}:        [SKIP][252] ([Intel XE#306]) -> [FAIL][253] +8 other tests fail
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - {shard-lnl}:        [SKIP][254] ([Intel XE#373]) -> [FAIL][255] +45 other tests fail
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@dp-mst-type-1:
    - {shard-lnl}:        [SKIP][256] ([Intel XE#307]) -> [FAIL][257] +2 other tests fail
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - {shard-lnl}:        [SKIP][258] ([Intel XE#1468]) -> [FAIL][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_content_protection@mei-interface.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - {shard-lnl}:        [SKIP][260] ([Intel XE#1413]) -> [FAIL][261] +4 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - {shard-lnl}:        [SKIP][262] ([Intel XE#1424]) -> [FAIL][263] +25 other tests fail
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - {shard-lnl}:        [SKIP][264] ([Intel XE#309]) -> [FAIL][265] +24 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {shard-lnl}:        [SKIP][266] ([Intel XE#323]) -> [FAIL][267] +3 other tests fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl}:        [FAIL][268] ([Intel XE#2028]) -> [FAIL][269] +7 other tests fail
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - {shard-lnl}:        [SKIP][270] ([Intel XE#701]) -> [FAIL][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_feature_discovery@chamelium.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - {shard-lnl}:        [SKIP][272] ([Intel XE#703]) -> [FAIL][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - {shard-lnl}:        [SKIP][274] ([Intel XE#1138]) -> [FAIL][275]
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_feature_discovery@display-4x.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - {shard-lnl}:        [SKIP][276] ([Intel XE#1421]) -> [FAIL][277] +35 other tests fail
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        [FAIL][278] ([Intel XE#1901]) -> [FAIL][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - {shard-lnl}:        [SKIP][280] ([Intel XE#1397] / [Intel XE#1745]) -> [FAIL][281] +6 other tests fail
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - {shard-lnl}:        [SKIP][282] ([Intel XE#1401] / [Intel XE#1745]) -> [FAIL][283] +21 other tests fail
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - {shard-lnl}:        [SKIP][284] ([Intel XE#352]) -> [FAIL][285] +2 other tests fail
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - {shard-lnl}:        [SKIP][286] ([Intel XE#651]) -> [FAIL][287] +63 other tests fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - {shard-lnl}:        [SKIP][288] ([Intel XE#1469]) -> [FAIL][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - {shard-lnl}:        [SKIP][290] ([Intel XE#656]) -> [FAIL][291] +169 other tests fail
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-4k:
    - {shard-lnl}:        [SKIP][292] ([Intel XE#1470]) -> [FAIL][293] +1 other test fail
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_invalid_mode@zero-clock:
    - {shard-lnl}:        [INCOMPLETE][294] ([Intel XE#1960]) -> [FAIL][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_invalid_mode@zero-clock.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - {shard-lnl}:        [SKIP][296] ([Intel XE#356]) -> [FAIL][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@tiling-yf:
    - {shard-lnl}:        [SKIP][298] ([Intel XE#1446]) -> [FAIL][299] +24 other tests fail
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - {shard-lnl}:        [SKIP][300] ([Intel XE#498]) -> [FAIL][301] +4 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - {shard-lnl}:        [SKIP][302] ([Intel XE#305]) -> [FAIL][303] +9 other tests fail
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - {shard-lnl}:        [INCOMPLETE][304] ([Intel XE#1608]) -> [FAIL][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - {shard-lnl}:        [SKIP][306] ([Intel XE#1131]) -> [FAIL][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - {shard-lnl}:        [FAIL][308] ([Intel XE#1430]) -> [FAIL][309] +1 other test fail
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - {shard-lnl}:        [SKIP][310] ([Intel XE#1439]) -> [FAIL][311] +3 other tests fail
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - {shard-lnl}:        [SKIP][312] ([Intel XE#1211]) -> [FAIL][313] +1 other test fail
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - {shard-lnl}:        [SKIP][314] ([Intel XE#1128]) -> [FAIL][315] +2 other tests fail
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-suspend:
    - {shard-lnl}:        [FAIL][316] ([Intel XE#2024]) -> [FAIL][317] +1 other test fail
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-no-drrs:
    - {shard-lnl}:        [SKIP][318] ([Intel XE#1406]) -> [FAIL][319] +20 other tests fail
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_psr@pr-no-drrs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-suspend:
    - {shard-lnl}:        [DMESG-FAIL][320] ([Intel XE#2034]) -> [FAIL][321]
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_psr@psr2-suspend.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - {shard-lnl}:        [SKIP][322] ([Intel XE#1437]) -> [FAIL][323] +8 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - {shard-lnl}:        [SKIP][324] ([Intel XE#1127]) -> [FAIL][325] +1 other test fail
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - {shard-lnl}:        [SKIP][326] ([Intel XE#1446] / [Intel XE#374]) -> [FAIL][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_scaling_modes@scaling-mode-none.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - {shard-lnl}:        [SKIP][328] ([Intel XE#1435]) -> [FAIL][329] +4 other tests fail
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - {shard-lnl}:        [SKIP][330] ([Intel XE#330]) -> [FAIL][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - {shard-lnl}:        [DMESG-FAIL][332] ([Intel XE#1608]) -> [FAIL][333] +2 other tests fail
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flip-suspend:
    - {shard-lnl}:        [DMESG-FAIL][334] ([Intel XE#1608] / [Intel XE#2034]) -> [FAIL][335] +1 other test fail
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_vrr@flip-suspend.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - {shard-lnl}:        [SKIP][336] ([Intel XE#1899]) -> [FAIL][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - {shard-lnl}:        [SKIP][338] ([Intel XE#756]) -> [FAIL][339] +2 other tests fail
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - {shard-lnl}:        [SKIP][340] ([Intel XE#1091]) -> [FAIL][341] +3 other tests fail
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_compute@ccs-mode-basic:
    - {shard-lnl}:        [SKIP][342] ([Intel XE#1447]) -> [FAIL][343]
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@create-big-vram:
    - {shard-lnl}:        [SKIP][344] ([Intel XE#1062]) -> [FAIL][345]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_create@create-big-vram.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - {shard-lnl}:        [SKIP][346] ([Intel XE#688]) -> [FAIL][347] +46 other tests fail
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - {shard-lnl}:        [SKIP][348] ([Intel XE#1392]) -> [FAIL][349] +37 other tests fail
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - {shard-lnl}:        [PASS][350] -> [FAIL][351] +1218 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [DMESG-WARN][352] ([Intel XE#1638]) -> [FAIL][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][354] ([Intel XE#1069]) -> [FAIL][355]
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_range_idle:
    - {shard-lnl}:        [SKIP][356] ([Intel XE#1462]) -> [FAIL][357]
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - {shard-lnl}:        [DMESG-WARN][358] ([Intel XE#1620]) -> [FAIL][359]
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_gt_freq@freq_suspend:
    - {shard-lnl}:        [SKIP][360] ([Intel XE#584]) -> [FAIL][361] +6 other tests fail
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_media_fill@media-fill:
    - {shard-lnl}:        [SKIP][362] ([Intel XE#560]) -> [FAIL][363]
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_media_fill@media-fill.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - {shard-lnl}:        [SKIP][364] ([Intel XE#512]) -> [FAIL][365]
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@xe_mmap@small-bar.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - {shard-lnl}:        [SKIP][366] ([Intel XE#1416]) -> [FAIL][367]
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@xe_mmap@vram.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_mmap@vram.html

  * igt@xe_module_load@reload:
    - {shard-lnl}:        [DMESG-WARN][368] ([Intel XE#2016]) -> [DMESG-FAIL][369] +2 other tests dmesg-fail
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_module_load@reload.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_module_load@reload.html

  * igt@xe_noexec_ping_pong:
    - {shard-lnl}:        [SKIP][370] ([Intel XE#379]) -> [FAIL][371]
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@xe_noexec_ping_pong.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_noexec_ping_pong.html

  * igt@xe_pat@pat-index-xehpc:
    - {shard-lnl}:        [SKIP][372] ([Intel XE#1420]) -> [FAIL][373]
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - {shard-lnl}:        [SKIP][374] ([Intel XE#977]) -> [FAIL][375]
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@xe_pat@pat-index-xelp.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - {shard-lnl}:        [SKIP][376] ([Intel XE#979]) -> [FAIL][377]
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - {shard-lnl}:        [SKIP][378] ([Intel XE#1061]) -> [FAIL][379] +1 other test fail
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_peer2peer@read.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - {shard-lnl}:        [SKIP][380] ([Intel XE#366]) -> [FAIL][381] +5 other tests fail
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_pm@d3cold-basic.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-mmap-vram:
    - {shard-lnl}:        [SKIP][382] ([Intel XE#1948]) -> [FAIL][383]
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@mocs-rpm:
    - {shard-lnl}:        [FAIL][384] ([Intel XE#2043]) -> [FAIL][385]
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_pm@mocs-rpm.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@xe_pm@mocs-rpm.html

  * igt@xe_pm@s2idle-basic:
    - {shard-lnl}:        [FAIL][386] ([Intel XE#1924]) -> [FAIL][387] +2 other tests fail
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_pm@s2idle-basic.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-mocs:
    - {shard-lnl}:        [DMESG-FAIL][388] ([Intel XE#1595]) -> [FAIL][389] +1 other test fail
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@xe_pm@s2idle-mocs.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - {shard-lnl}:        [SKIP][390] ([Intel XE#579]) -> [FAIL][391]
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - {shard-lnl}:        [FAIL][392] ([Intel XE#2009]) -> [FAIL][393]
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - {shard-lnl}:        [FAIL][394] ([Intel XE#958]) -> [FAIL][395]
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-size:
    - {shard-lnl}:        [SKIP][396] ([Intel XE#944]) -> [FAIL][397] +10 other tests fail
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@basic-wedged:
    - {shard-lnl}:        [DMESG-WARN][398] ([Intel XE#1760]) -> [FAIL][399]
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@xe_wedged@basic-wedged.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_wedged@basic-wedged.html

  
New tests
---------

  New tests have been introduced between XEIGT_7880_full and XEIGTPW_11239_full:

### New IGT tests (40) ###

  * igt@xe_oa@blocking:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@buffer-fill:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@disabled-read-error:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@enable-disable:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@map-oa-buffer:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mi-rpc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@missing-sample-flags:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mmio-triggered-reports:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-sampling-read-error:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-system-wide-paranoid:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-formats:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@polling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@short-reads:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@xe-ref-count:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_query@multigpu-query-oa-units:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-oa-units:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11239_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [FAIL][400] ([Intel XE#1204])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     [PASS][401] -> [FAIL][402] ([Intel XE#1068])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_exec_reset@cm-gt-reset.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][403] -> [FAIL][404] ([Intel XE#1204]) +6 other tests fail
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * {igt@xe_oa@non-system-wide-paranoid} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][405] ([Intel XE#1201]) +33 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_oa@non-system-wide-paranoid.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate:
    - {shard-lnl}:        [SKIP][406] ([Intel XE#1192]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#1124] / [Intel XE#1201]) -> [FAIL][409] ([Intel XE#1204])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [FAIL][410] ([Intel XE#1045] / [Intel XE#1204]) -> [FAIL][411] ([Intel XE#1204])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][413] ([Intel XE#378])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
  [Intel XE#2009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2009
  [Intel XE#2016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2016
  [Intel XE#2024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2024
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
  [Intel XE#2043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2043
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7880 -> IGTPW_11239
  * Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -> xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037

  IGTPW_11239: e1c92a280ba09388fabf5484d0f6f276fa136f44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c
  xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/index.html

--===============3317548356768309831==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7880_full -&gt; XEIGTPW_11239_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11239_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11239_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11239_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">FAIL</a> +1396 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@map-oa-buffer} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_oa@map-oa-buffer.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@stress-open-close} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_oa@stress-open-close.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_query@multigpu-query-oa-units} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_query@query-uc-fw-version-huc.html">FAIL</a> +320 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">FAIL</a> +50 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_big_joiner@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">FAIL</a> +56 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_chamelium_color@degamma.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">FAIL</a> +44 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_content_protection@srm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_cursor_legacy@single-move.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_fbcon_fbt@psr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_feature_discovery@psr1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html">FAIL</a> +144 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> +147 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_psr@psr-dpms.html">FAIL</a> +91 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_rmfb@close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_rmfb@close-fd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-434/igt@kms_vrr@flipline.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-on.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_exec_fault_mode@once-basic-imm.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">FAIL</a> +120 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_media_fill@media-fill.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_mmap@small-bar.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_module_load@reload.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_wedged@basic-wedged.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_getversion@all-cards}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2016">Intel XE#2016</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@core_hotunplug@hotrebind.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_3d.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_addfb_basic@no-handle.html">FAIL</a> +693 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@kms_async_flips@test-cursor.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_big_joiner@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">FAIL</a> +65 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_cdclk@mode-transition.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">FAIL</a> +45 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_content_protection@mei-interface.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_feature_discovery@chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_feature_discovery@display-3x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_feature_discovery@display-4x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">FAIL</a> +169 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_invalid_mode@zero-clock.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960">Intel XE#1960</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_invalid_mode@zero-clock.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2024">Intel XE#2024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@kms_psr@pr-no-drrs.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@kms_psr@psr2-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034">Intel XE#2034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_psr@psr2-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-90.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@kms_vrr@flip-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034">Intel XE#2034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@kms_vrr@flip-suspend.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899">Intel XE#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_create@create-big-vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_evict@evict-beng-large-external-cm.html">FAIL</a> +46 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_exec_fault_mode@many-invalid-fault.html">FAIL</a> +1218 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_media_fill@media-fill.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_mmap@small-bar.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2016">Intel XE#2016</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_module_load@reload.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_noexec_ping_pong.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@xe_pat@pat-index-xelp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@xe_peer2peer@read.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_pm@d3cold-basic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@mocs-rpm:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-5/igt@xe_pm@mocs-rpm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2043">Intel XE#2043</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-5/igt@xe_pm@mocs-rpm.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_pm@s2idle-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_pm@s2idle-basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_pm@s2idle-mocs.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2009">Intel XE#2009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-2/igt@xe_pm_residency@gt-c6-freeze.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-3/igt@xe_wedged@basic-wedged.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7880_full and XEIGTPW_11239_full:</p>
<h3>New IGT tests (40)</h3>
<ul>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@sysctl-defaults:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@xe-ref-count:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-oa-units:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11239_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_exec_reset@cm-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-464/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@non-system-wide-paranoid} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-433/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +33 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11239/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7880 -&gt; IGTPW_11239</li>
<li>Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -&gt; xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037</li>
</ul>
<p>IGTPW_11239: e1c92a280ba09388fabf5484d0f6f276fa136f44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c<br />
  xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037</p>

</body>
</html>

--===============3317548356768309831==--
