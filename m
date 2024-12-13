Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128B2E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 15:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1910F048;
	Fri, 13 Dec 2024 15:12:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7A10F048;
 Fri, 13 Dec 2024 15:12:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4481305640854510072=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fdirtyfb?=
 =?utf-8?q?=3A_Add_skip_condition_for_bmg_platform_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 15:12:07 -0000
Message-ID: <173410272792.2161794.1856775180066266239@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241113174118.158849-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113174118.158849-1-mohammed.thasleem@intel.com>
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

--===============4481305640854510072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dirtyfb: Add skip condition for bmg platform (rev3)
URL   : https://patchwork.freedesktop.org/series/141312/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8154_full -> XEIGTPW_12309_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12309_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12309_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12309_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-dp-2.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl:
    - shard-bmg:          [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_dirtyfb@default-dirtyfb-ioctl.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [PASS][6] -> [FAIL][7] +4 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-lnl:          [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-4/igt@kms_psr@fbc-psr2-no-drrs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_psr@fbc-psr2-no-drrs.html

  
#### Warnings ####

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][13] ([Intel XE#2141]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][15] ([Intel XE#1508]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][17] ([Intel XE#2333]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12309_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@core_hotunplug@hotreplug.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@core_hotunplug@hotreplug.html
    - shard-dg2-set2:     [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3467] / [Intel XE#3468])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][23] ([Intel XE#3467] / [Intel XE#3468])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1125])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#3468] / [Intel XE#3783])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-bmg:          [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2385])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#316]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2327]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1407])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3658])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#2705] / [Intel XE#3468])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1727]) +2 other tests incomplete
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124]) +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1124]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#610])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2191])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2191])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#367]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#787]) +136 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-dp-5.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#3432])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#3432])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2907]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-5.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2724])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#314]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#314]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1152]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#373]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2325]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#306]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2252]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#373]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][64] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2341])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#3407])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-5.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2321]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2320]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2321])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2:
    - shard-bmg:          [PASS][70] -> [DMESG-FAIL][71] ([Intel XE#3468]) +14 other tests dmesg-fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][72] ([Intel XE#2705] / [Intel XE#3468])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#309])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2286]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#323])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2291]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2244]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2244])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#455]) +20 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#701])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#703])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1138])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> [FAIL][85] ([Intel XE#2882])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#3321]) +3 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2316])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2316]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][91] -> [FAIL][92] ([Intel XE#3098])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][93] ([Intel XE#3468]) +10 other tests dmesg-fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#301]) +4 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#3321]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp5.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][96] -> [DMESG-WARN][97] ([Intel XE#3468]) +97 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][98] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][99] -> [INCOMPLETE][100] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests incomplete
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2293]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1401] / [Intel XE#1745])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][105] -> [DMESG-WARN][106] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +5 other tests dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [PASS][107] -> [DMESG-FAIL][108] ([Intel XE#2705] / [Intel XE#3468])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [PASS][109] -> [DMESG-FAIL][110] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2311]) +16 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#651]) +34 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2312]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][114] ([Intel XE#2333]) +7 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#651]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#656]) +11 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#653]) +34 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2313]) +21 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][119] ([Intel XE#1727]) +1 other test incomplete
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-6.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1503])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-7/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2934])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#356])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format:
    - shard-bmg:          [PASS][123] -> [INCOMPLETE][124] ([Intel XE#1035] / [Intel XE#3468])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_plane@pixel-format.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_plane@pixel-format.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2493])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][126] ([Intel XE#1727]) +4 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2763]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [PASS][128] -> [DMESG-WARN][129] ([Intel XE#2566] / [Intel XE#3468]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2763]) +11 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2763]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#870])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][134] ([Intel XE#1430])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#908])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#2029])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][139] -> [DMESG-FAIL][140] ([Intel XE#1727] / [Intel XE#3468])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][141] -> [DMESG-WARN][142] ([Intel XE#3468]) +7 other tests dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][143] -> [DMESG-WARN][144] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][145] ([Intel XE#3468]) +2 other tests dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prop_blob@basic:
    - shard-bmg:          [PASS][146] -> [DMESG-WARN][147] ([Intel XE#2705])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_prop_blob@basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2893]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1489]) +11 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#1489]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1128])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2387])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1122])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1406])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#3414])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#3414])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1435])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1435])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#330])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1499])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#756])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#756])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1126]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][166] ([Intel XE#3468]) +20 other tests dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#2905]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2905]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][169] ([Intel XE#1473])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-small:
    - shard-bmg:          [PASS][170] -> [DMESG-WARN][171] ([Intel XE#1473] / [Intel XE#3468]) +2 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_evict@evict-threads-small.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#688]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][173] -> [DMESG-WARN][174] ([Intel XE#1727]) +11 other tests dmesg-warn
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2322]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1392]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#288]) +25 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#2905]) +10 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [PASS][179] -> [DMESG-WARN][180] ([Intel XE#1727]) +7 other tests dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#3467]) +2 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][183] ([Intel XE#3343] / [Intel XE#3468])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [PASS][184] -> [DMESG-WARN][185] ([Intel XE#3343]) +1 other test dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][186] ([Intel XE#3467]) +2 other tests dmesg-warn
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][187] -> [SKIP][188] ([Intel XE#1192])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][189] ([Intel XE#1999]) +2 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214]) -> ([PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [SKIP][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239]) ([Intel XE#378])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-434/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#977])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#2284] / [Intel XE#366])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [PASS][243] -> [DMESG-WARN][244] ([Intel XE#1727] / [Intel XE#3468]) +11 other tests dmesg-warn
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_pm@d3hot-mmap-system.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          [PASS][245] -> [DMESG-WARN][246] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][247] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][248] -> [DMESG-WARN][249] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][250] -> [DMESG-WARN][251] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_pm@s4-mocs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#944])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#944]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#3342])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [PASS][255] -> [DMESG-WARN][256] ([Intel XE#2919])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_wedged@basic-wedged.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][257] ([Intel XE#3421])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][258] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][259] +6 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][260] ([Intel XE#1426]) -> [PASS][261] +3 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [INCOMPLETE][262] ([Intel XE#3225]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
    - shard-dg2-set2:     [INCOMPLETE][264] ([Intel XE#3225]) -> [PASS][265] +1 other test pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][266] ([Intel XE#3468]) -> [PASS][267] +20 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][268] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][269] +4 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][270] ([Intel XE#2705]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_color@degamma@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][272] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][273] +2 other tests pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_color@degamma@pipe-a-dp-2.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_color@degamma@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][274] ([Intel XE#3468]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][276] ([Intel XE#2291]) -> [PASS][277] +2 other tests pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][278] ([Intel XE#301]) -> [PASS][279] +1 other test pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][280] ([Intel XE#2882]) -> [PASS][281] +1 other test pass
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][282] ([Intel XE#2316]) -> [PASS][283] +4 other tests pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][284] ([Intel XE#3321]) -> [PASS][285] +1 other test pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:
    - shard-bmg:          [FAIL][286] ([Intel XE#3780]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [DMESG-FAIL][288] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][289] +8 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][290] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][291] +3 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [DMESG-WARN][292] ([Intel XE#1727]) -> [PASS][293] +13 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [INCOMPLETE][294] -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [DMESG-WARN][296] ([Intel XE#1727]) -> [PASS][297] +7 other tests pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][298] ([Intel XE#1727]) -> [PASS][299] +3 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][300] ([Intel XE#718]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-bmg:          [DMESG-WARN][302] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][303] +10 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][304] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][306] ([Intel XE#1435]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][308] ([Intel XE#899]) -> [PASS][309] +2 other tests pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [INCOMPLETE][310] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [DMESG-WARN][312] ([Intel XE#3468]) -> [PASS][313] +90 other tests pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
    - shard-dg2-set2:     [DMESG-WARN][314] ([Intel XE#3468]) -> [PASS][315] +3 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [INCOMPLETE][316] -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [INCOMPLETE][318] -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
    - shard-dg2-set2:     [DMESG-FAIL][320] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][321] +3 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][322] ([Intel XE#1473]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][324] ([Intel XE#1727] / [Intel XE#358]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [DMESG-WARN][326] ([Intel XE#3343]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [DMESG-WARN][328] ([Intel XE#3467]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-dg2-set2:     [DMESG-WARN][330] ([Intel XE#3467]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][332] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][333] +2 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][334] ([Intel XE#2998]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#1192]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-464/igt@xe_live_ktest@xe_dma_buf.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_mmap@system:
    - shard-bmg:          [DMESG-WARN][338] -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_mmap@system.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_mmap@system.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [DMESG-WARN][340] ([Intel XE#1616] / [Intel XE#3468]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@xe_pm@s2idle-multiple-execs.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][342] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-dg2-set2:     [DMESG-WARN][344] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [DMESG-WARN][346] ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_pm_residency@gt-c6-freeze.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][348] ([Intel XE#1727]) -> [INCOMPLETE][349] ([Intel XE#2705])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][350] ([Intel XE#2715] / [Intel XE#3468]) -> [FAIL][351] ([Intel XE#1178]) +1 other test fail
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][352] ([Intel XE#1188]) -> [DMESG-FAIL][353] ([Intel XE#3468]) +1 other test dmesg-fail
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_content_protection@uevent.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-bmg:          [DMESG-WARN][354] ([Intel XE#3468]) -> [DMESG-FAIL][355] ([Intel XE#3468])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][356] ([Intel XE#2291]) -> [DMESG-WARN][357] ([Intel XE#3468]) +1 other test dmesg-warn
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][358] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][359] ([Intel XE#877]) +1 other test dmesg-warn
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][360] ([Intel XE#2291]) -> [DMESG-WARN][361] ([Intel XE#3468] / [Intel XE#877])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][362] ([Intel XE#2882]) -> [DMESG-FAIL][363] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][364] ([Intel XE#3321]) -> [DMESG-WARN][365] ([Intel XE#3468]) +1 other test dmesg-warn
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][366] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][367] ([Intel XE#2316])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][368] ([Intel XE#2311]) -> [SKIP][369] ([Intel XE#2312]) +8 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][370] ([Intel XE#3468]) -> [FAIL][371] ([Intel XE#2333]) +11 other tests fail
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][372] ([Intel XE#2333]) -> [SKIP][373] ([Intel XE#2312]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][374] ([Intel XE#2333]) -> [INCOMPLETE][375] ([Intel XE#1727])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][376] ([Intel XE#2312]) -> [FAIL][377] ([Intel XE#2333]) +5 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [FAIL][378] ([Intel XE#2333]) -> [DMESG-FAIL][379] ([Intel XE#3468]) +7 other tests dmesg-fail
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][380] ([Intel XE#2312]) -> [SKIP][381] ([Intel XE#2311]) +6 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][382] ([Intel XE#2312]) -> [SKIP][383] ([Intel XE#2313]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][384] ([Intel XE#2313]) -> [SKIP][385] ([Intel XE#2312]) +9 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#455]) -> [INCOMPLETE][387] ([Intel XE#1727])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [INCOMPLETE][388] ([Intel XE#1035] / [Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][389] ([Intel XE#1035] / [Intel XE#3468]) +1 other test incomplete
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [ABORT][390] ([Intel XE#3468]) -> [DMESG-WARN][391] ([Intel XE#1727] / [Intel XE#3468])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [DMESG-WARN][392] ([Intel XE#3468]) -> [SKIP][393] ([Intel XE#1499])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][394] ([Intel XE#1473]) -> [FAIL][395] ([Intel XE#1000])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][396] ([Intel XE#1473] / [Intel XE#2472]) -> [TIMEOUT][397] ([Intel XE#1473])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [FAIL][398] ([Intel XE#1000]) -> [INCOMPLETE][399] ([Intel XE#1473])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_evict@evict-threads-large.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-WARN][400] ([Intel XE#3467]) -> [DMESG-WARN][401] ([Intel XE#3467] / [Intel XE#3468])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#455]) -> [SKIP][403] ([Intel XE#1192])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-dg2-463/igt@xe_live_ktest@xe_eudebug.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][404] ([Intel XE#3421] / [Intel XE#3467]) -> [ABORT][405] ([Intel XE#3421])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
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
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3780
  [Intel XE#3783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3783
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8154 -> IGTPW_12309
  * Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -> xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3

  IGTPW_12309: ef78836a524be530258e279bdecdad7d049051cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662bfc451bc232c5d24cc
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be46262724a61ae951e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/index.html

--===============4481305640854510072==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dirtyfb: Add skip condition =
for bmg platform (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141312/">https://patchwork.freedesktop.org/series/141312/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12309/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12309/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8154_full -&gt; XEIGTPW_12309_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12309_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12309_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
309_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12309/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-m=
c-ccs@pipe-b-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x128@pipe-a-dp-2.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@default-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/sha=
rd-bmg-7/igt@kms_dirtyfb@default-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12309/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">FAIL=
</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12309/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html">DMES=
G-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@a-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-4/igt@kms_psr@fbc-psr2-no-drrs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-8/=
igt@kms_psr@fbc-psr2-no-drrs.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE=
#2141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12309/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE=
#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12309/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-cur-indfb-draw-render.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12309_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/=
igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) +1 other test dmesg-warn</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-=
436/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"=
>Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2309/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3783">Intel XE#3783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12309/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-event=
s.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-=
hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12309/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-=
180-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_bw@connected-linear-tiling=
-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-dp-5:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-1=
80-y-tiled-gen12-mc-ccs@pipe-b-dp-5.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +136 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
24">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_chamelium_color@gamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with=
out-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_content_protection@atomic.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_content_protection@srm@pip=
e-a-dp-5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3407">Intel XE#3407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-d=
p-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12309/shard-bmg-5/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe=
-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) +14 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top=
-bottom@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_dsc@dsc-with-output-format=
s-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12309/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12309/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/sh=
ard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12309/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">=
Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank@a-dp2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdm=
i-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@=
d-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) +97 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp=
-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel=
 XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-l=
inear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_flip_scale=
d_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x=
-to-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-=
dp-2-x-to-4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x=
-to-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-=
dp-2-x-to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +34 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
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
/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_hdr@invalid-hdr@pipe-a-hdm=
i-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-7/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/ig=
t@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_plane_scaling@invalid-para=
meters.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-wit=
h-pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_plane_scaling@planes-downs=
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
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_plane_scaling@planes-downs=
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
/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_pm_backlight@basic-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Int=
el XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-4/igt@k=
ms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@km=
s_pm_rpm@i2c.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
309/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-d=
g2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-st=
ress-no-wait.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@k=
ms_prop_blob@basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1128">Intel XE#1128</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_psr@psr-sprite-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_rotation_crc@sprite-rotati=
on-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_tv_load_detect@load-detect=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-8/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single=
-full-load-isolation.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +20 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-1/igt@xe_eudebug@basic-vm-bind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_eudebug_online@single-step-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_evict@evict-beng-mixed-thread=
s-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bm=
g-7/igt@xe_evict@evict-threads-small.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-st=
andalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shar=
d-dg2-435/igt@xe_exec_basic@many-null-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_exec_fault_mode@twice-userp=
tr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint=
-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_exec_threads@threads-bal-shared-vm-userptr-in=
validate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_exec_threads@threads-bal-shared=
-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +7 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_fault_injection@inject-fault-=
probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_relay_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_fault_injection@inject-fault=
-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_fault_injection@vm-bind-fai=
l-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt=
@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_=
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
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12309/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shar=
d-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12309/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
309/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12309/shard-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12309/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shar=
d-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12309/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-bu=
ffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">=
Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_pm@d3hot-mmap-system.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/i=
gt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)=
 +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-b=
mg-4/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Int=
el XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_pm@s=
4-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_query@multigpu-query-invali=
d-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-46=
4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeou=
t.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@kms_atomic_interruptible@legacy-setmode@pipe-a=
-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@km=
s_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html">PASS</a> +6 oth=
er tests pass</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-lnl-2/igt@kms_atomic_tran=
sition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +3 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225=
">Intel XE#3225</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12309/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PA=
SS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
25">Intel XE#3225</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12309/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a=
-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_ccs@crc-primary-ba=
sic-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_ccs@crc-primar=
y-suspend-4-tiled-bmg-ccs.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@=
pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_ccs@crc-=
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
/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_color@degamma@pipe-a-dp-2.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12309/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_cursor_lega=
cy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@bd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3780">Intel XE#3780</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-dp2.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.=
html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-46=
6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html"=
>PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-upscaling.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@kms_flip_s=
caled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +13 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-=
shrfb-draw-blt.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12309/shard-lnl-5/igt@kms_frontbuffer_tracking@fb=
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
el-xe/IGTPW_12309/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html">=
PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a=
-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@kms_pipe_crc_basic@hang=
-read-crc@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-=
lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_pm_rpm@legacy-planes@plane-50.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_pm_rpm@legacy-planes@pla=
ne-50.html">PASS</a> +10 other tests pass</li>
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
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_pm_rpm@=
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
ee/intel-xe/IGTPW_12309/shard-bmg-5/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12309/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE=
#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@suspend-resume.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0=
-system-vram01.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_ccs@suspen=
d-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> +90 other =
tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@linear-compressed-compfm=
t0-system-vram01.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@su=
spend-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt=
0-vram01-vram01.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_ccs@suspend-resume@ti=
le4-compressed-compfmt0-vram01-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0=
-system-vram01.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_ccs@suspend-resume@xmajo=
r-compressed-compfmt0-system-vram01.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_ccs@suspend-resume@xmajor-compressed-compfm=
t0-system-vram01.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-436=
/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html">P=
ASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12309/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-l=
arge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-userptr=
-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-463/igt@xe=
_exec_threads@threads-hang-shared-vm-userptr-invalidate.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function=
-xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_pm_init_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@xe_fault_inj=
ection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_o=
ps_prepare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_fault_inject=
ion@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a></li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_fault_inject=
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
/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kuni=
t.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-464/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#11=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
309/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@xe_mmap@system.html">DMESG-WARN</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@=
xe_mmap@system.html">PASS</a></li>
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
ree/intel-xe/IGTPW_12309/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html">=
PASS</a></li>
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
fx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@xe_pm@s4-vm-bind-unb=
ind-all.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">In=
tel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2280">Intel XE#2280</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt@xe_pm@s4-vm-bind=
-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3088">Intel XE#3088</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-433/igt@xe_pm_residency=
@gt-c6-freeze.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12309/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_content_pro=
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
_12309/shard-bmg-5/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12309/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-bot=
tom.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12309/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomi=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
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
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa=
-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_flip@2x-flip-vs-=
panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shr=
fb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-3/igt@kms_frontbuff=
er_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-pgflip-blt.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12309/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-lin=
ear.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-6/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/sha=
rd-dg2-466/igt@kms_hdr@invalid-hdr.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12309/shard-dg2-466/igt=
@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2309/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
8">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@kms_vrr@negative-basic.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12309/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">I=
ntel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12309/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">I=
ntel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2472">Intel XE#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12309/shard-bmg-4/igt@xe_evict@evict-mixed-many=
-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-8/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#=
1000</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12309/shard-bmg-2/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE=
#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12309/shard-bmg-8/igt@xe_fault_injection@vm-bind-=
fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-dg2-463/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1230=
9/shard-dg2-466/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8154/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel=
 XE#3421</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12309/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8154 -&gt; IGTPW_12309</li>
<li>Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -&gt; xe-2368-a=
4502e763bb931b68fa9be46262724a61ae951e3</li>
</ul>
<p>IGTPW_12309: ef78836a524be530258e279bdecdad7d049051cf @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662b=
fc451bc232c5d24cc<br />
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be4=
6262724a61ae951e3</p>

</body>
</html>

--===============4481305640854510072==--
