Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE87D711A6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 20:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC7210E3AF;
	Thu, 18 Dec 2025 20:21:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328EA10E3AF;
 Thu, 18 Dec 2025 20:21:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3090320501513518614=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/kms=3A_Carve_up_igt=5F?=
 =?utf-8?q?display=5Frequire=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Dec 2025 20:21:08 -0000
Message-ID: <176608926816.103427.8057911235236902156@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
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

--===============3090320501513518614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Carve up igt_display_require()
URL   : https://patchwork.freedesktop.org/series/159165/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8670_FULL -> XEIGTPW_14230_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14230_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14230_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14230_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +281 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [FAIL][3] +131 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - shard-lnl:          [PASS][4] -> [FAIL][5] +612 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_getfb@getfb2-handle-not-fb.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          NOTRUN -> [FAIL][8] +162 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pm@s2idle-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_pm@s2idle-basic.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          [SKIP][11] ([Intel XE#1466]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [FAIL][13] ([Intel XE#6054]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][15] ([Intel XE#664]) -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          [SKIP][17] ([Intel XE#3279]) -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][19] ([Intel XE#2370]) -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][21] ([Intel XE#2327]) -> [FAIL][22] +13 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][23] ([Intel XE#3658]) -> [FAIL][24] +3 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][25] ([Intel XE#1407]) -> [FAIL][26] +25 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][27] ([Intel XE#2328]) -> [FAIL][28] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][29] ([Intel XE#1477]) -> [FAIL][30] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][31] ([Intel XE#1428]) -> [FAIL][32] +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][33] ([Intel XE#610]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][35] ([Intel XE#1124]) -> [FAIL][36] +33 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][37] ([Intel XE#1467]) -> [FAIL][38] +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][39] ([Intel XE#607]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][41] ([Intel XE#1124]) -> [FAIL][42] +56 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          [SKIP][43] ([Intel XE#2191]) -> [FAIL][44] +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][45] ([Intel XE#1512]) -> [FAIL][46] +7 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][47] ([Intel XE#2314] / [Intel XE#2894]) -> [FAIL][48] +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][49] ([Intel XE#367]) -> [FAIL][50] +8 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][51] ([Intel XE#367]) -> [FAIL][52] +7 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][53] ([Intel XE#2887]) -> [FAIL][54] +83 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][55] ([Intel XE#3862]) -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-lnl:          [SKIP][57] ([Intel XE#2669] / [Intel XE#3433]) -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][59] ([Intel XE#3432]) -> [FAIL][60] +8 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][61] ([Intel XE#3432]) -> [FAIL][62] +4 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][63] ([Intel XE#2669]) -> [FAIL][64] +4 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][65] ([Intel XE#2887]) -> [FAIL][66] +43 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][67] ([Intel XE#2652] / [Intel XE#787]) -> [FAIL][68] +3 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][69] ([Intel XE#4417]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_cdclk@mode-transition.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][71] ([Intel XE#2724]) -> [FAIL][72] +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          [SKIP][73] ([Intel XE#4418]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][75] ([Intel XE#306]) -> [FAIL][76] +7 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][77] ([Intel XE#2325]) -> [FAIL][78] +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          [SKIP][79] ([Intel XE#373]) -> [FAIL][80] +50 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][81] ([Intel XE#2252]) -> [FAIL][82] +35 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][83] ([Intel XE#6507]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-lnl:          [SKIP][85] ([Intel XE#6507]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][87] ([Intel XE#2390]) -> [FAIL][88] +2 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][89] ([Intel XE#6743]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-lnl:          [SKIP][91] ([Intel XE#6692]) -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_content_protection@dp-mst-suspend-resume.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][93] ([Intel XE#307]) -> [FAIL][94] +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][95] ([Intel XE#1178]) -> [FAIL][96] +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][97] ([Intel XE#1468]) -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_content_protection@mei-interface.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          [SKIP][99] ([Intel XE#6705]) -> [FAIL][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_content_protection@suspend-resume.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][101] ([Intel XE#3278]) -> [FAIL][102] +6 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_content_protection@uevent.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][103] ([Intel XE#6707]) -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_content_protection@uevent.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][105] ([Intel XE#2320]) -> [FAIL][106] +14 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][107] ([Intel XE#2321]) -> [FAIL][108] +8 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-bmg:          [SKIP][109] ([Intel XE#2321]) -> [FAIL][110] +4 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          [SKIP][111] ([Intel XE#1424]) -> [FAIL][112] +25 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          [SKIP][113] ([Intel XE#309]) -> [FAIL][114] +25 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][115] ([Intel XE#2286]) -> [FAIL][116] +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][117] ([Intel XE#323]) -> [FAIL][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][119] ([Intel XE#4210]) -> [FAIL][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][121] ([Intel XE#4302]) -> [FAIL][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][123] ([Intel XE#4354]) -> [FAIL][124] +3 other tests fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-bmg:          [SKIP][125] ([Intel XE#4354]) -> [FAIL][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][127] ([Intel XE#4294]) -> [FAIL][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][129] ([Intel XE#2244]) -> [FAIL][130] +6 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][131] ([Intel XE#2244]) -> [FAIL][132] +4 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-lnl:          [CRASH][133] ([Intel XE#6706]) -> [FAIL][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_fb_coherency@memset-crc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][135] ([Intel XE#4422]) -> [FAIL][136] +2 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][137] ([Intel XE#4422]) -> [FAIL][138] +2 other tests fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][139] ([Intel XE#2372]) -> [FAIL][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_feature_discovery@chamelium.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [SKIP][141] ([Intel XE#6557] / [Intel XE#6703]) -> [FAIL][142] +3 other tests fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@display-1x.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][143] ([Intel XE#702]) -> [FAIL][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_feature_discovery@display-2x.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][145] ([Intel XE#703]) -> [FAIL][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          [SKIP][147] ([Intel XE#1138]) -> [FAIL][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_feature_discovery@display-4x.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          [SKIP][149] ([Intel XE#1138]) -> [FAIL][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_feature_discovery@display-4x.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          [SKIP][151] ([Intel XE#1137]) -> [FAIL][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          [SKIP][153] ([Intel XE#2375]) -> [FAIL][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][155] ([Intel XE#2316]) -> [FAIL][156] +3 other tests fail
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          [SKIP][157] ([Intel XE#1421]) -> [FAIL][158] +34 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][159] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][160] +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [SKIP][161] ([Intel XE#6703]) -> [FAIL][162] +299 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [FAIL][163] ([Intel XE#4683]) -> [FAIL][164] +1 other test fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][165] ([Intel XE#2380]) -> [FAIL][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][167] ([Intel XE#1397] / [Intel XE#1745]) -> [FAIL][168] +7 other tests fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][169] ([Intel XE#1401] / [Intel XE#1745]) -> [FAIL][170] +23 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][171] ([Intel XE#2293] / [Intel XE#2380]) -> [FAIL][172] +14 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][173] ([Intel XE#4141]) -> [FAIL][174] +38 other tests fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][175] ([Intel XE#6312]) -> [FAIL][176] +10 other tests fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][177] ([Intel XE#2312]) -> [FAIL][178] +24 other tests fail
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][179] ([Intel XE#2311]) -> [FAIL][180] +88 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][181] ([Intel XE#651]) -> [FAIL][182] +67 other tests fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          [SKIP][183] ([Intel XE#1469]) -> [FAIL][184] +2 other tests fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          [SKIP][185] ([Intel XE#2352]) -> [FAIL][186] +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][187] ([Intel XE#2350]) -> [FAIL][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#2313]) -> [FAIL][190] +83 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][191] ([Intel XE#656]) -> [FAIL][192] +212 other tests fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][193] ([Intel XE#3374] / [Intel XE#3544]) -> [FAIL][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [ABORT][195] ([Intel XE#6740]) -> [FAIL][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][197] ([Intel XE#1503]) -> [FAIL][198] +4 other tests fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][199] ([Intel XE#1450] / [Intel XE#2568]) -> [FAIL][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          [SKIP][201] ([Intel XE#6901]) -> [FAIL][202] +1 other test fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html
    - shard-bmg:          [SKIP][203] ([Intel XE#6901]) -> [FAIL][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          [SKIP][205] ([Intel XE#4298]) -> [FAIL][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          [SKIP][207] ([Intel XE#4298]) -> [FAIL][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          [SKIP][209] ([Intel XE#6900]) -> [FAIL][210] +3 other tests fail
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_joiner@basic-ultra-joiner.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][211] -> [FAIL][212] +1 other test fail
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          [SKIP][213] ([Intel XE#2925]) -> [FAIL][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][215] -> [FAIL][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [FAIL][217] ([Intel XE#5195]) -> [FAIL][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][219] ([Intel XE#599]) -> [FAIL][220] +3 other tests fail
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_plane_lowres@tiling-x.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][221] ([Intel XE#4596]) -> [FAIL][222] +4 other tests fail
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-none.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][223] ([Intel XE#5021]) -> [FAIL][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-lnl:          [FAIL][225] ([Intel XE#4658]) -> [FAIL][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_plane_multiple@tiling-x.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][227] ([Intel XE#5020]) -> [FAIL][228] +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-bmg:          [SKIP][229] ([Intel XE#5020]) -> [FAIL][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][231] ([Intel XE#3307]) -> [FAIL][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][233] ([Intel XE#6886]) -> [FAIL][234] +12 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
    - shard-bmg:          [SKIP][235] ([Intel XE#6886]) -> [FAIL][236] +2 other tests fail
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][237] ([Intel XE#870]) -> [FAIL][238] +1 other test fail
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][239] ([Intel XE#736]) -> [FAIL][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-bmg:          [SKIP][241] ([Intel XE#2391]) -> [FAIL][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][243] ([Intel XE#1131]) -> [FAIL][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][245] ([Intel XE#2392]) -> [FAIL][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          [SKIP][247] ([Intel XE#3309]) -> [FAIL][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][249] ([Intel XE#718]) -> [FAIL][250] +1 other test fail
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][251] ([Intel XE#2029]) -> [FAIL][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          [SKIP][253] ([Intel XE#2505]) -> [FAIL][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][255] ([Intel XE#1439] / [Intel XE#836]) -> [FAIL][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][257] ([Intel XE#6693]) -> [FAIL][258] +3 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][259] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [FAIL][260] +2 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          [SKIP][261] ([Intel XE#1439] / [Intel XE#3141]) -> [FAIL][262] +3 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          [SKIP][263] ([Intel XE#6813]) -> [FAIL][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_pm_rpm@package-g7.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][265] ([Intel XE#1406] / [Intel XE#1489]) -> [FAIL][266] +24 other tests fail
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][267] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) -> [FAIL][268] +10 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][269] ([Intel XE#1406] / [Intel XE#2893]) -> [FAIL][270] +20 other tests fail
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][271] ([Intel XE#1406] / [Intel XE#6703]) -> [FAIL][272] +24 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          [SKIP][273] ([Intel XE#1406]) -> [FAIL][274] +34 other tests fail
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_psr@pr-sprite-render.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][275] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [FAIL][276] +36 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][277] ([Intel XE#3414] / [Intel XE#3904]) -> [FAIL][278] +11 other tests fail
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [FAIL][279] ([Intel XE#4689]) -> [FAIL][280] +1 other test fail
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][281] ([Intel XE#1127]) -> [FAIL][282] +3 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][283] ([Intel XE#2330]) -> [FAIL][284] +1 other test fail
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][285] ([Intel XE#3414] / [Intel XE#3904]) -> [FAIL][286] +4 other tests fail
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][287] ([Intel XE#6503]) -> [FAIL][288] +5 other tests fail
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_sharpness_filter@filter-formats.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][289] ([Intel XE#362]) -> [FAIL][290] +1 other test fail
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-lnl:          [FAIL][291] ([Intel XE#4459]) -> [FAIL][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_vrr@cmrr.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][293] ([Intel XE#2168]) -> [FAIL][294] +1 other test fail
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_vrr@lobf.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_vrr@lobf.html
    - shard-lnl:          [FAIL][295] ([Intel XE#6390]) -> [FAIL][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_vrr@lobf.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][297] ([Intel XE#1499]) -> [FAIL][298] +2 other tests fail
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_vrr@negative-basic.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][299] ([Intel XE#1499]) -> [FAIL][300] +1 other test fail
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14230_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][301] -> [SKIP][302] ([Intel XE#2134]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@fbdev@unaligned-read.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#1125])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][304] ([Intel XE#6703]) +102 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][305] -> [SKIP][306] ([Intel XE#6693]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][307] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][308] ([Intel XE#1406] / [Intel XE#2387])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][309] ([Intel XE#1406] / [Intel XE#2414])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][310] ([Intel XE#1435])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][311] ([Intel XE#1091] / [Intel XE#2849])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][312] ([Intel XE#1447])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          NOTRUN -> [SKIP][313] ([Intel XE#6010])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug@basic-connect:
    - shard-bmg:          NOTRUN -> [SKIP][314] ([Intel XE#4837]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][315] ([Intel XE#4837]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-lnl:          NOTRUN -> [SKIP][316] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][317] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][318] ([Intel XE#688]) +4 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][319] ([Intel XE#2322]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][320] ([Intel XE#1392]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][321] -> [SKIP][322] ([Intel XE#6703]) +362 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-bmg:          [PASS][323] -> [SKIP][324] ([Intel XE#6557] / [Intel XE#6703]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_exec_compute_mode@twice-basic.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][325] ([Intel XE#6874]) +13 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][326] ([Intel XE#6874]) +18 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][327] ([Intel XE#5007])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][328] ([Intel XE#4943]) +10 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][329] ([Intel XE#4943]) +6 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-remap:
    - shard-bmg:          NOTRUN -> [SKIP][330] ([Intel XE#6557] / [Intel XE#6703])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-remap.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][331] ([Intel XE#2248])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][332] ([Intel XE#2284] / [Intel XE#366])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][333] -> [FAIL][334] ([Intel XE#6251])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          NOTRUN -> [SKIP][335] ([Intel XE#4650])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][336] ([Intel XE#4733]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][337] ([Intel XE#944]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][338] ([Intel XE#944])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][339] ([Intel XE#4130])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [FAIL][340] ([Intel XE#5937]) +2 other tests fail
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
    - shard-lnl:          NOTRUN -> [SKIP][341] ([Intel XE#4273])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-lnl:          NOTRUN -> [SKIP][342] ([Intel XE#6376])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_sriov_vram@vf-access-beyond.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][343] ([Intel XE#2134]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@fbdev@unaligned-write.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@fbdev@unaligned-write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][345] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@intel_hwmon@hwmon-read.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][347] ([Intel XE#6361]) -> [PASS][348] +2 other tests pass
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-bmg:          [SKIP][349] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][350] +2 other tests pass
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][351] -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_module_load@reload.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@xe_module_load@reload.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][353] ([Intel XE#6251]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][355] ([Intel XE#6569]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [SKIP][357] ([Intel XE#6703]) -> [PASS][358] +573 other tests pass
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_sriov_vram@vf-access-provisioned.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][359] ([Intel XE#2327]) -> [SKIP][360] ([Intel XE#6703]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][361] ([Intel XE#1124]) -> [SKIP][362] ([Intel XE#6703]) +5 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][363] ([Intel XE#610]) -> [SKIP][364] ([Intel XE#6703])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][365] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][366] ([Intel XE#6703]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][367] ([Intel XE#367]) -> [SKIP][368] ([Intel XE#6703])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][369] ([Intel XE#2887]) -> [SKIP][370] ([Intel XE#6703]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][371] ([Intel XE#3432]) -> [SKIP][372] ([Intel XE#6703])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][373] ([Intel XE#2325]) -> [SKIP][374] ([Intel XE#6703])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          [SKIP][375] ([Intel XE#2252]) -> [SKIP][376] ([Intel XE#6703]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][377] ([Intel XE#2390]) -> [SKIP][378] ([Intel XE#6703])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][379] ([Intel XE#2341]) -> [SKIP][380] ([Intel XE#6703])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_content_protection@lic-type-1.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][381] ([Intel XE#2320]) -> [SKIP][382] ([Intel XE#6703]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][383] ([Intel XE#2321]) -> [SKIP][384] ([Intel XE#6703]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][385] ([Intel XE#2244]) -> [SKIP][386] ([Intel XE#6703])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][387] ([Intel XE#6703]) -> [SKIP][388] ([Intel XE#4156])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][389] ([Intel XE#2316]) -> [SKIP][390] ([Intel XE#6703]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][391] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][392] ([Intel XE#6703]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][393] ([Intel XE#4141]) -> [SKIP][394] ([Intel XE#6703]) +3 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][395] ([Intel XE#2311]) -> [SKIP][396] ([Intel XE#6703]) +16 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][397] ([Intel XE#2312]) -> [SKIP][398] ([Intel XE#6703]) +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][399] ([Intel XE#2313]) -> [SKIP][400] ([Intel XE#6703]) +15 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][401] ([Intel XE#3544]) -> [SKIP][402] ([Intel XE#6703])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][403] ([Intel XE#2486]) -> [SKIP][404] ([Intel XE#6703])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][405] ([Intel XE#6886]) -> [SKIP][406] ([Intel XE#6703])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][407] ([Intel XE#3309]) -> [SKIP][408] ([Intel XE#6703])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][409] ([Intel XE#2499]) -> [SKIP][410] ([Intel XE#6703])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][411] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][412] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][413] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][414] ([Intel XE#1406] / [Intel XE#6703]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][415] ([Intel XE#1406] / [Intel XE#2234]) -> [SKIP][416] ([Intel XE#1406] / [Intel XE#6703])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][417] ([Intel XE#2330]) -> [SKIP][418] ([Intel XE#6703])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][419] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][420] ([Intel XE#6703]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][421] ([Intel XE#6703]) -> [SKIP][422] ([Intel XE#1435])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][423] ([Intel XE#6503]) -> [SKIP][424] ([Intel XE#6703]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_sharpness_filter@filter-basic.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][425] ([Intel XE#2426]) -> [SKIP][426] ([Intel XE#6703])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][427] ([Intel XE#2450]) -> [SKIP][428] ([Intel XE#6557] / [Intel XE#6703])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][429] ([Intel XE#1499]) -> [SKIP][430] ([Intel XE#6703]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_vrr@flip-suspend.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][431] ([Intel XE#6599]) -> [SKIP][432] ([Intel XE#6703])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@xe_compute@ccs-mode-compute-kernel.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-bmg:          [SKIP][433] ([Intel XE#4837]) -> [SKIP][434] ([Intel XE#6703]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@xe_eudebug@attach-debug-metadata.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          [SKIP][435] ([Intel XE#6703]) -> [SKIP][436] ([Intel XE#4837]) +11 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug@vma-ufence.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][437] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][438] ([Intel XE#6703]) +3 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][439] ([Intel XE#6703]) -> [SKIP][440] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][441] ([Intel XE#6703]) -> [INCOMPLETE][442] ([Intel XE#6321])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][443] ([Intel XE#6703]) -> [SKIP][444] ([Intel XE#2322]) +9 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][445] ([Intel XE#2322]) -> [SKIP][446] ([Intel XE#6703]) +5 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-bmg:          [SKIP][447] ([Intel XE#6874]) -> [SKIP][448] ([Intel XE#6703]) +18 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][449] ([Intel XE#6703]) -> [SKIP][450] ([Intel XE#6874]) +33 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][451] ([Intel XE#5007]) -> [SKIP][452] ([Intel XE#6703])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][453] ([Intel XE#6703]) -> [SKIP][454] ([Intel XE#4943]) +19 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][455] ([Intel XE#4943]) -> [SKIP][456] ([Intel XE#6703]) +17 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][457] ([Intel XE#6703]) -> [SKIP][458] ([Intel XE#586])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_mmap@small-bar.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][459] ([Intel XE#6703]) -> [SKIP][460] ([Intel XE#2248])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][461] ([Intel XE#2245]) -> [SKIP][462] ([Intel XE#6703])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][463] ([Intel XE#6703]) -> [SKIP][464] ([Intel XE#2284])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          [SKIP][465] ([Intel XE#6703]) -> [SKIP][466] ([Intel XE#4733])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][467] ([Intel XE#4733]) -> [SKIP][468] ([Intel XE#6703]) +2 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][469] ([Intel XE#6703]) -> [SKIP][470] ([Intel XE#944]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][471] ([Intel XE#944]) -> [SKIP][472] ([Intel XE#6703]) +2 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][473] ([Intel XE#6557] / [Intel XE#6703]) -> [FAIL][474] ([Intel XE#5937])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6692
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8670 -> IGTPW_14230

  IGTPW_14230: 14230
  IGT_8670: 8670
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/index.html

--===============3090320501513518614==
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
<tr><td><b>Series:</b></td><td>lib/kms: Carve up igt_display_require()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159165/">https://patchwork.freedesktop.org/series/159165/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8670_FULL -&gt; XEIGTPW_14230_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14230_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14230_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14230_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">FAIL</a> +281 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> +131 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_getfb@getfb2-handle-not-fb.html">FAIL</a> +612 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_pat@display-vs-wb-transient.html">FAIL</a> +162 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_pm@s2idle-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">FAIL</a> +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> +56 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">FAIL</a> +83 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_cdclk@mode-transition.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a> +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">FAIL</a> +50 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_content_protection@dp-mst-suspend-resume.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6692">Intel XE#6692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_content_protection@dp-mst-suspend-resume.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_content_protection@mei-interface.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705">Intel XE#6705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_content_protection@suspend-resume.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_content_protection@uevent.html">FAIL</a> +6 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_content_protection@uevent.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html">FAIL</a> +8 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html">FAIL</a> +3 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_fb_coherency@memset-crc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_feature_discovery@display-1x.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_feature_discovery@display-2x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_feature_discovery@display-3x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_feature_discovery@display-4x.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_feature_discovery@dp-mst.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> +299 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">FAIL</a> +23 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">FAIL</a> +88 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">FAIL</a> +67 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">FAIL</a> +2 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">FAIL</a> +83 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">FAIL</a> +212 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_hdr@brightness-with-hdr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html">FAIL</a> +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@kms_joiner@basic-max-non-joiner.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">FAIL</a> +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_plane_multiple@tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658">Intel XE#4658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_plane_multiple@tiling-x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html">FAIL</a> +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">FAIL</a> +12 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_pm_backlight@fade-with-dpms.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_pm_rpm@i2c.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_pm_rpm@package-g7.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_psr@pr-sprite-render.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@kms_psr@psr2-no-drrs.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_vrr@cmrr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@kms_vrr@cmrr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@kms_vrr@lobf.html">FAIL</a> +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@kms_vrr@lobf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390">Intel XE#6390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@kms_vrr@lobf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_vrr@negative-basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14230_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-8/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +362 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-remap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) +2 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-3/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-9/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@xe_sriov_vram@vf-access-provisioned.html">PASS</a> +573 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-10/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8670 -&gt; IGTPW_14230</li>
</ul>
<p>IGTPW_14230: 14230<br />
  IGT_8670: 8670<br />
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87</p>

</body>
</html>

--===============3090320501513518614==--
