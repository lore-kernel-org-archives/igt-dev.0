Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E3BE6ADD3
	for <igt-dev@archiver.kernel.org>; Sat, 23 Nov 2024 01:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199610E452;
	Sat, 23 Nov 2024 01:16:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4510E44E;
 Sat, 23 Nov 2024 01:16:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7127217741116205479=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Drop_PSR_+_DRRS_tests_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 23 Nov 2024 01:16:53 -0000
Message-ID: <173232461309.1897372.17217671419108773059@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
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

--===============7127217741116205479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Drop PSR + DRRS tests (rev2)
URL   : https://patchwork.freedesktop.org/series/141596/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8121_full -> XEIGTPW_12172_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12172_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12172_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12172_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-a3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +6 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  
#### Warnings ####

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][4] ([Intel XE#2316]) -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][6] ([Intel XE#3467]) -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][8] ([Intel XE#2961] / [Intel XE#3191]) -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12172_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2423])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_getclient.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@core_getclient.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#3440]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@core_getversion@all-cards.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#1885])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@core_hotunplug@hotunbind-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#3249])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#3453])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2134])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@fbdev@eof.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@fbdev@eof.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2423] / [i915#2575]) +130 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][24] ([Intel XE#3162])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2327])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1407])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2136]) +45 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +90 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2907])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][41] ([Intel XE#1727])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#314]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1152]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2252]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2390])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#1178]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2321])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [PASS][53] -> [DMESG-FAIL][54] ([Intel XE#3468]) +23 other tests dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2320]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1424])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
    - shard-dg2-set2:     [PASS][59] -> [INCOMPLETE][60] ([Intel XE#3468]) +1 other test incomplete
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#3468])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][63] ([Intel XE#1727] / [Intel XE#3468])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2423] / [i915#2575]) +18 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2291]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#309]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2425])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1340])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2244])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2136]) +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1727]) +3 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2316]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#2882]) +3 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#3097]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][81] -> [DMESG-FAIL][82] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][83] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][84] ([Intel XE#3468]) +1 other test dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][85] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#886]) +4 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#651]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][91] ([Intel XE#3468]) +5 other tests dmesg-fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][92] ([Intel XE#2333]) +2 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#651])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#656]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2312]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#653]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2313])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2934])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2486])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][100] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][101] ([Intel XE#1727] / [Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][102] ([Intel XE#616]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][103] ([Intel XE#3468]) +19 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2763]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#870])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#718])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][109] ([Intel XE#3468]) +7 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-bmg:          [PASS][110] -> [DMESG-WARN][111] ([Intel XE#1727] / [Intel XE#3468]) +16 other tests dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_pm_rpm@legacy-planes@plane-68:
    - shard-dg2-set2:     NOTRUN -> [ABORT][112] ([Intel XE#3468])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes@plane-68.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][113] -> [SKIP][114] ([Intel XE#2446]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2893]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1489]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#3414]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#3414]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2413])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2413] / [Intel XE#374])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#374]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#899])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-bmg:          [PASS][126] -> [INCOMPLETE][127] ([Intel XE#1727]) +2 other tests incomplete
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-rpm.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][128] -> [FAIL][129] ([Intel XE#2159]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2905]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2905])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2905])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][133] -> [INCOMPLETE][134] ([Intel XE#1473])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][135] -> [TIMEOUT][136] ([Intel XE#1473])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#688]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#1130]) +237 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_balancer@once-parallel-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1130]) +22 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_balancer@once-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2322])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#3343])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][144] ([Intel XE#3467])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][145] ([Intel XE#3467])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][146] -> [DMESG-WARN][147] ([Intel XE#3467]) +3 other tests dmesg-warn
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][148] -> [SKIP][149] ([Intel XE#2229]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [PASS][150] -> [INCOMPLETE][151] ([Intel XE#2998]) +1 other test incomplete
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][152] -> [SKIP][153] ([Intel XE#1192])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html
    - shard-bmg:          [PASS][154] -> [SKIP][155] ([Intel XE#1192])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2457])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][157] -> [DMESG-WARN][158] ([Intel XE#3467])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@many-reload.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#3573])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2248])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][161] ([Intel XE#1173])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [PASS][162] -> [DMESG-WARN][163] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s2idle-basic-exec.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][164] -> [DMESG-WARN][165] ([Intel XE#1727] / [Intel XE#3468])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][166] -> [DMESG-WARN][167] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][168] -> [ABORT][169] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_prime_self_import@basic-with_one_bo_two_files:
    - shard-bmg:          [PASS][170] -> [DMESG-WARN][171] ([Intel XE#1727]) +2 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_prime_self_import@basic-with_one_bo_two_files.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_prime_self_import@basic-with_one_bo_two_files.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#3342])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#3342])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][174] -> [DMESG-WARN][175] ([Intel XE#3468]) +123 other tests dmesg-warn
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-lnl:          [DMESG-WARN][176] -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2423]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@core_setmaster_vs_auth.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@core_setmaster_vs_auth.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2134]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@fbdev@nullptr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][182] ([Intel XE#827]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][184] ([Intel XE#911]) -> [PASS][185] +3 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          [DMESG-WARN][186] -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][188] ([Intel XE#2291]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][190] ([Intel XE#3009]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_aux_dev.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][192] ([Intel XE#3070]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][194] ([Intel XE#2316]) -> [PASS][195] +5 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][196] ([Intel XE#3321] / [Intel XE#3487]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][198] ([Intel XE#2882]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2423] / [i915#2575]) -> [PASS][201] +71 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip@busy-flip.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][202] ([Intel XE#886]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][207] +3 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-dg2-set2:     [DMESG-WARN][208] ([Intel XE#1727]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_force_connector_basic@force-edid.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2136]) -> [PASS][211] +20 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][212] ([Intel XE#1503]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - shard-bmg:          [DMESG-WARN][214] ([Intel XE#877]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
    - shard-bmg:          [DMESG-FAIL][216] -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [DMESG-FAIL][218] ([Intel XE#3468]) -> [PASS][219] +9 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][220] ([Intel XE#2571]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][222] ([Intel XE#1430]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-lnl:          [DMESG-WARN][224] ([Intel XE#3184]) -> [PASS][225] +2 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2446]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][228] ([Intel XE#3559]) -> [PASS][229] +4 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][230] ([Intel XE#1435]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][232] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][234] ([Intel XE#3468]) -> [PASS][235] +41 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][236] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][237] +4 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [INCOMPLETE][238] ([Intel XE#1727]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_exercise_blt@fast-copy:
    - shard-bmg:          [INCOMPLETE][240] -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_exercise_blt@fast-copy.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#3467]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][244] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [DMESG-WARN][246] ([Intel XE#3467]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_module_load@reload.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][248] ([Intel XE#2514]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
    - shard-bmg:          [FAIL][250] ([Intel XE#2514]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][252] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][254] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_pm@s4-basic.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [DMESG-WARN][256] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s4-mocs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1130]) -> [PASS][259] +138 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [INCOMPLETE][260] ([Intel XE#3468]) -> [DMESG-WARN][261] ([Intel XE#3468])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][263] ([Intel XE#316]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2136]) -> [SKIP][265] ([Intel XE#316]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#316]) -> [SKIP][267] ([Intel XE#2136] / [Intel XE#2351])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#316]) -> [SKIP][269] ([Intel XE#2136]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#607]) -> [SKIP][271] ([Intel XE#2136] / [Intel XE#2351])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2136]) -> [SKIP][273] ([Intel XE#610])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2136]) -> [SKIP][275] ([Intel XE#1124]) +7 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#607]) -> [SKIP][277] ([Intel XE#2136])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#610]) -> [SKIP][279] ([Intel XE#2136])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1124]) -> [SKIP][281] ([Intel XE#2136]) +9 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1124]) -> [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][285] ([Intel XE#1124]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2191]) -> [SKIP][287] ([Intel XE#2423] / [i915#2575])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2423] / [i915#2575]) -> [SKIP][289] ([Intel XE#2191]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#367]) -> [SKIP][291] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2423] / [i915#2575]) -> [SKIP][293] ([Intel XE#367]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][295] ([Intel XE#2136]) +14 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][297] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2136]) -> [SKIP][299] ([Intel XE#2907]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][301] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2907]) -> [SKIP][303] ([Intel XE#2136])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2136]) -> [SKIP][305] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2136]) -> [DMESG-WARN][307] ([Intel XE#1727])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cdclk@mode-transition.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][309] ([Intel XE#314])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2423] / [i915#2575]) -> [SKIP][311] ([Intel XE#306]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#306]) -> [SKIP][313] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#373]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575]) +16 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2423] / [i915#2575]) -> [SKIP][317] ([Intel XE#373]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][318] ([Intel XE#1178]) -> [INCOMPLETE][319] ([Intel XE#1727] / [Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_content_protection@atomic.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#307]) -> [SKIP][321] ([Intel XE#2423] / [i915#2575])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2423] / [i915#2575]) -> [SKIP][323] ([Intel XE#307]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2423] / [i915#2575]) -> [FAIL][325] ([Intel XE#1178])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@legacy.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][326] ([Intel XE#2341]) -> [FAIL][327] ([Intel XE#1178]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@srm.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [FAIL][328] ([Intel XE#1178]) -> [SKIP][329] ([Intel XE#2423] / [i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_content_protection@srm.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][330] ([Intel XE#2341]) -> [DMESG-FAIL][331] ([Intel XE#3468])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@uevent.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#308]) -> [SKIP][333] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#323]) -> [SKIP][335] ([Intel XE#2423] / [i915#2575])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][336] ([Intel XE#2291]) -> [DMESG-WARN][337] ([Intel XE#3468])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2423] / [i915#2575]) -> [SKIP][339] ([Intel XE#323])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#455]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][343] ([Intel XE#455]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [FAIL][344] ([Intel XE#1695]) -> [DMESG-FAIL][345] ([Intel XE#3468])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#701]) -> [SKIP][347] ([Intel XE#2423] / [i915#2575])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#703]) -> [SKIP][349] ([Intel XE#2423] / [i915#2575])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1138]) -> [SKIP][351] ([Intel XE#2423] / [i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1135]) -> [SKIP][353] ([Intel XE#2423] / [i915#2575])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#1135])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_feature_discovery@psr2.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2423] / [i915#2575]) -> [DMESG-FAIL][357] ([Intel XE#1727] / [Intel XE#3468])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#455]) -> [SKIP][359] ([Intel XE#2136]) +7 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2423] / [i915#2575]) -> [SKIP][361] ([i915#5274])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][362] ([Intel XE#2311]) -> [SKIP][363] ([Intel XE#2312]) +15 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#651]) -> [SKIP][365] ([Intel XE#2136]) +34 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][367] ([Intel XE#651]) +9 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [DMESG-FAIL][368] ([Intel XE#3468]) -> [SKIP][369] ([Intel XE#2312])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][370] ([Intel XE#2312]) -> [FAIL][371] ([Intel XE#2333]) +8 other tests fail
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][372] ([Intel XE#3468]) -> [FAIL][373] ([Intel XE#2333]) +3 other tests fail
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][374] ([Intel XE#2333]) -> [SKIP][375] ([Intel XE#2312]) +6 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][376] ([Intel XE#2333]) -> [DMESG-FAIL][377] ([Intel XE#3468]) +10 other tests dmesg-fail
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][379] ([Intel XE#658])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136]) -> [SKIP][381] ([Intel XE#651]) +18 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][382] ([Intel XE#2312]) -> [SKIP][383] ([Intel XE#2311]) +14 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#651]) -> [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][386] ([Intel XE#2313]) -> [SKIP][387] ([Intel XE#2312]) +15 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#653]) -> [SKIP][389] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][390] ([Intel XE#2312]) -> [SKIP][391] ([Intel XE#2313]) +14 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][393] ([Intel XE#653]) +12 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#653]) +11 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#653]) -> [SKIP][397] ([Intel XE#2136]) +37 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#346]) -> [SKIP][399] ([Intel XE#2136]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2136]) -> [SKIP][401] ([Intel XE#2927])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2423] / [i915#2575]) -> [SKIP][403] ([Intel XE#356])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2423] / [i915#2575]) -> [SKIP][405] ([Intel XE#455]) +7 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_panel_fitting@legacy.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][407] ([Intel XE#1727] / [Intel XE#3468])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [FAIL][408] ([Intel XE#616]) -> [SKIP][409] ([Intel XE#2423] / [i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_plane_cursor@overlay.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2423] / [i915#2575]) -> [FAIL][411] ([Intel XE#616])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][413] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2423] / [i915#2575]) -> [SKIP][415] ([Intel XE#2763] / [Intel XE#455])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#2938]) -> [SKIP][417] ([Intel XE#2136])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#2136]) -> [SKIP][419] ([Intel XE#870])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_backlight@fade.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][420] ([Intel XE#1430]) -> [DMESG-FAIL][421] ([Intel XE#3468])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#1129]) -> [SKIP][423] ([Intel XE#2136] / [Intel XE#2351])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#908]) -> [SKIP][425] ([Intel XE#2136])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2446]) -> [DMESG-FAIL][427] ([Intel XE#3468])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#2446]) -> [ABORT][429] ([Intel XE#3468]) +1 other test abort
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2446]) -> [DMESG-WARN][431] ([Intel XE#1727] / [Intel XE#3468])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][432] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][433] ([Intel XE#2446])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [ABORT][434] ([Intel XE#3468]) -> [SKIP][435] ([Intel XE#2446])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#1489]) -> [SKIP][437] ([Intel XE#2136]) +13 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2136]) -> [SKIP][439] ([Intel XE#1489]) +6 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2136]) -> [SKIP][441] ([Intel XE#1122])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#1122]) -> [SKIP][443] ([Intel XE#2136])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][445] ([Intel XE#2136]) +13 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#2136]) -> [SKIP][447] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][449] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr@pr-dpms.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][451] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][453] ([Intel XE#2351]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2423] / [i915#2575]) -> [SKIP][455] ([Intel XE#3414]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#3414]) -> [SKIP][457] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#362]) -> [SKIP][459] ([Intel XE#2423] / [i915#2575])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][460] ([Intel XE#2426]) -> [SKIP][461] ([Intel XE#2509])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#455]) -> [SKIP][463] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_vrr@flip-dpms.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#756]) -> [SKIP][465] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#1123]) -> [SKIP][467] ([Intel XE#1130]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1130]) -> [SKIP][469] ([Intel XE#1126])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1126]) -> [SKIP][471] ([Intel XE#1130])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#2905]) -> [SKIP][473] ([Intel XE#1130]) +14 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#1130]) -> [SKIP][475] ([Intel XE#2905]) +8 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][476] ([Intel XE#1600]) -> [SKIP][477] ([Intel XE#1130]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][478] ([Intel XE#1727]) -> [SKIP][479] ([Intel XE#1130])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#288]) -> [SKIP][481] ([Intel XE#1130]) +37 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#1130]) -> [SKIP][483] ([Intel XE#288]) +21 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#2360]) -> [SKIP][485] ([Intel XE#1130])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][486] ([Intel XE#3371] / [Intel XE#3515]) -> [DMESG-WARN][487] ([Intel XE#3468])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#1130]) -> [DMESG-WARN][489] ([Intel XE#3515])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][490] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][491] ([Intel XE#3467]) +1 other test dmesg-warn
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [DMESG-WARN][492] ([Intel XE#1727] / [Intel XE#3343]) -> [SKIP][493] ([Intel XE#1130])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1130]) -> [DMESG-WARN][495] ([Intel XE#3343]) +1 other test dmesg-warn
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [DMESG-WARN][496] ([Intel XE#3343]) -> [SKIP][497] ([Intel XE#1130])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     [DMESG-WARN][498] ([Intel XE#3467]) -> [SKIP][499] ([Intel XE#1130])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][500] ([Intel XE#3343]) -> [DMESG-WARN][501] ([Intel XE#3343] / [Intel XE#3468])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][502] ([Intel XE#3499]) -> [DMESG-FAIL][503] ([Intel XE#3467])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#1130]) -> [DMESG-WARN][505] ([Intel XE#3467]) +2 other tests dmesg-warn
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
    - shard-bmg:          [FAIL][506] ([Intel XE#3499]) -> [DMESG-FAIL][507] ([Intel XE#3467] / [Intel XE#3468])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][508] ([Intel XE#3521]) -> [DMESG-WARN][509] ([Intel XE#3467] / [Intel XE#3468])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#512]) -> [SKIP][511] ([Intel XE#1130])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_mmap@small-bar.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-WARN][512] ([Intel XE#3467]) -> [FAIL][513] ([Intel XE#3546])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#3573]) -> [SKIP][515] ([Intel XE#1130]) +7 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#1130]) -> [SKIP][517] ([Intel XE#3573]) +2 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#1337]) -> [SKIP][519] ([Intel XE#1130])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#1130]) -> [SKIP][521] ([Intel XE#977])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#1061]) -> [FAIL][523] ([Intel XE#1173])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_peer2peer@write.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][525] ([Intel XE#1130])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_pm@d3cold-basic.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#1130]) -> [SKIP][527] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#1130]) -> [SKIP][529] ([Intel XE#2284])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [DMESG-WARN][530] ([Intel XE#3468]) -> [SKIP][531] ([Intel XE#1130])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][532] ([Intel XE#1727] / [Intel XE#3468]) -> [ABORT][533] ([Intel XE#1358] / [Intel XE#1727] / [Intel XE#3468])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#1130]) -> [DMESG-WARN][535] ([Intel XE#1727] / [Intel XE#3468])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@s2idle-mocs.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [DMESG-WARN][536] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][537] ([Intel XE#1130])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@s3-mocs.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][538] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][539] ([Intel XE#3468] / [Intel XE#569])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#1130]) -> [DMESG-WARN][541] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#944]) -> [SKIP][543] ([Intel XE#1130]) +3 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#1130]) -> [SKIP][545] ([Intel XE#944]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#3342]) -> [SKIP][547] ([Intel XE#1130])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][548] ([Intel XE#2919]) -> [SKIP][549] ([Intel XE#1130])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_wedged@basic-wedged.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#1130]) -> [ABORT][551] ([Intel XE#3075] / [Intel XE#3084])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8121 -> IGTPW_12172
  * Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -> xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199

  IGTPW_12172: 12172
  IGT_8121: 8121
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/index.html

--===============7127217741116205479==
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
<tr><td><b>Series:</b></td><td>Drop PSR + DRRS tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141596/">https://patchwork.freedesktop.org/series/141596/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8121_full -&gt; XEIGTPW_12172_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12172_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12172_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12172_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race@ab-dp2-hdmi-a3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12172_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_getclient.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +130 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +23 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097">Intel XE#3097</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-68:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes@plane-68.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_vblank@ts-continuation-modeset-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-rpm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +237 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_balancer@once-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +123 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@core_setmaster_vs_auth.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@core_setmaster_vs_auth.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_flip@busy-flip.html">PASS</a> +71 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_force_connector_basic@force-edid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559">Intel XE#3559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_exercise_blt@fast-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +138 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_plane_cursor@overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 other tests dmesg-warn</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521">Intel XE#3521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-436/igt@xe_pm@s2idle-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-433/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12172/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8121 -&gt; IGTPW_12172</li>
<li>Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -&gt; xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199</li>
</ul>
<p>IGTPW_12172: 12172<br />
  IGT_8121: 8121<br />
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380<br />
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199</p>

</body>
</html>

--===============7127217741116205479==--
