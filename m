Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA0DC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 14:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF74910E0DA;
	Sun,  6 Apr 2025 14:37:59 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC3810E0C4;
 Sun,  6 Apr 2025 14:37:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7416931492483147626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_man/lsgpu=3A_Add_man_page_?=
 =?utf-8?q?for_lsgpu?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 14:37:59 -0000
Message-ID: <174395027928.40986.9796700083970702065@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327110616.59257-1-peter.senna@linux.intel.com>
In-Reply-To: <20250327110616.59257-1-peter.senna@linux.intel.com>
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

--===============7416931492483147626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: man/lsgpu: Add man page for lsgpu
URL   : https://patchwork.freedesktop.org/series/146860/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8289_FULL -> XEIGTPW_12857_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12857_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12857_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12857_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@deep-color@pipe-b-dp-2-degamma:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-dg2-set2:     [PASS][3] -> ([INCOMPLETE][4], [PASS][5])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_vrr@negative-basic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_vrr@negative-basic@pipe-a-dp-2.html

  
#### Warnings ####

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][7] ([Intel XE#1499]) -> ([SKIP][8], [INCOMPLETE][9]) ([Intel XE#1499])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_vrr@negative-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12857_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4173]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#3767]) +15 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][13] -> ([FAIL][14], [PASS][15]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3768])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3279])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3658])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#316])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#610])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#619])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1477])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2314] / [Intel XE#2894])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2191]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1512])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#367])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#367])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455] / [Intel XE#787]) +37 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#455] / [Intel XE#787]) +12 other tests ( 2 skip )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#787]) +176 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2669]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#787]) +40 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2907])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#3442])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#3432])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#787]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][64], [INCOMPLETE][65]) ([Intel XE#2705])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2652] / [Intel XE#787]) +30 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2724])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2325])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#306]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#306]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#373]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2252]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-lnl:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#373])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#373]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#4346])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_color@deep-color.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][81], [FAIL][82]) ([Intel XE#1178])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#307])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#307])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2390])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#307])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][87], [FAIL][88]) ([Intel XE#1178] / [Intel XE#455])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#3304])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#1178]) +3 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#1178]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][92] ([Intel XE#1188])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#308])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1424])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2320]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#309])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][98] -> ([PASS][99], [SKIP][100]) ([Intel XE#309]) +4 other tests ( 1 pass, 1 skip )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-bmg:          [PASS][101] -> ([SKIP][102], [SKIP][103]) ([Intel XE#2291])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2286]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][105] -> ([SKIP][106], [PASS][107]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#309])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][110] -> ([SKIP][111], [SKIP][112]) ([Intel XE#309])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2291]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#2291])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#309]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-bmg:          NOTRUN -> ([PASS][118], [INCOMPLETE][119]) ([Intel XE#3226]) +1 other test ( 1 incomplete, 1 pass )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_cursor_legacy@torture-bo.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][120] -> ([PASS][121], [SKIP][122]) ([Intel XE#3009])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_dp_aux_dev.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_dp_aux_dev.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#4354])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [PASS][124] -> ([PASS][125], [SKIP][126]) ([Intel XE#4354])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-sst.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-sst.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4356])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2244]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4422])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#4422])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#776])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#776])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#1135])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#2316])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#310]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][139] -> ([PASS][140], [SKIP][141]) ([Intel XE#310]) +6 other tests ( 1 pass, 1 skip )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#310]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][143] -> ([FAIL][144], [FAIL][145]) ([Intel XE#301] / [Intel XE#3321])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][146] -> ([FAIL][147], [FAIL][148]) ([Intel XE#301]) +1 other test ( 2 fail )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][149] -> ([PASS][150], [FAIL][151]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][152] -> ([FAIL][153], [FAIL][154]) ([Intel XE#3321])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#310])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][156], [PASS][157]) ([Intel XE#310])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][158] -> ([PASS][159], [SKIP][160]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][161] -> [INCOMPLETE][162] ([Intel XE#2049]) +1 other test incomplete
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1421]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     [PASS][164] -> ([SKIP][165], [SKIP][166]) ([Intel XE#310])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][167] -> ([INCOMPLETE][168], [PASS][169]) ([Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][170] -> [FAIL][171] ([Intel XE#301] / [Intel XE#3321])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][172] -> [FAIL][173] ([Intel XE#301]) +6 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][174] -> [DMESG-WARN][175] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][176] ([Intel XE#2049] / [Intel XE#2597])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#1401]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#1397] / [Intel XE#1745])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([Intel XE#1397])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#455]) +7 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2293]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#651]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#656]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2311]) +11 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#651]) +14 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> ([PASS][194], [INCOMPLETE][195]) ([Intel XE#2050])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][196] -> ([SKIP][197], [SKIP][198]) ([Intel XE#656]) +1 other test ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][199] -> [SKIP][200] ([Intel XE#656]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2312]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#656]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-lnl:          NOTRUN -> ([SKIP][203], [SKIP][204]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#4141]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
    - shard-dg2-set2:     [PASS][206] -> ([PASS][207], [SKIP][208]) ([Intel XE#656]) +9 other tests ( 1 pass, 1 skip )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#1151])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#651]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][211], [SKIP][212]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 2 skip )
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][213], [SKIP][214]) ([Intel XE#651] / [Intel XE#656])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([Intel XE#651])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][217], [SKIP][218]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#653] / [Intel XE#656])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> ([SKIP][221], [SKIP][222]) ([Intel XE#2312])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#656]) +13 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#653]) +10 other tests ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#653]) +10 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#2313]) +6 other tests ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#2313]) +12 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#653]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#455]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([Intel XE#1503])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][234] ([Intel XE#4298])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#346])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#2934])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#4329])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][239] ([Intel XE#616])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#599])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     NOTRUN -> ([PASS][241], [SKIP][242]) ([Intel XE#4596])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-none.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [PASS][243] -> ([PASS][244], [SKIP][245]) ([Intel XE#4596])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-x.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-x.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#2493])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][247] ([Intel XE#4212])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][248] ([Intel XE#4540])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#2763]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#2763]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][252] ([Intel XE#870]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#1122])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#1129])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          [PASS][256] -> ([FAIL][257], [PASS][258]) ([Intel XE#718])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][259] ([Intel XE#3309])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][260] ([Intel XE#1430])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#836])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-lnl:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#1439] / [Intel XE#836])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][264] ([Intel XE#2893]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][265], [SKIP][266]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#2893])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#1489]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][270] ([Intel XE#1489]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#1489]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][274], [SKIP][275]) ([Intel XE#2850] / [Intel XE#929]) +7 other tests ( 2 skip )
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [FAIL][276] ([Intel XE#4568]) +1 other test fail
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([Intel XE#2234] / [Intel XE#2850]) +1 other test ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][279] ([Intel XE#1406]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#2850] / [Intel XE#929])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_psr@pr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][281] ([Intel XE#2939])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#2414])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][283] ([Intel XE#2330])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][284] ([Intel XE#1127])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][285] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][286] ([Intel XE#3414])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> ([SKIP][287], [SKIP][288]) ([Intel XE#3414] / [Intel XE#3904])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-270.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][289], [SKIP][290]) ([Intel XE#3414] / [Intel XE#3904])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][291] -> [FAIL][292] ([Intel XE#2883]) +2 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-8/igt@kms_setmode@basic.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-9/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#1435])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#455]) +6 other tests ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#2168])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][297] ([Intel XE#756])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][298], [SKIP][299]) ([Intel XE#756])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][300], [SKIP][301]) ([Intel XE#756])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][302] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#944]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#2905]) +7 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@xe_eudebug@basic-close.html
    - shard-lnl:          NOTRUN -> [SKIP][305] ([Intel XE#2905]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> ([SKIP][306], [SKIP][307]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@xe_eudebug@basic-connect.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][308] ([Intel XE#2905])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#2905])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_eudebug_online@pagefault-read.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][311], [SKIP][312]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][313] ([Intel XE#2905]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> [SKIP][314] ([Intel XE#4519])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#4518])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][317] ([Intel XE#261] / [Intel XE#688])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][318] ([Intel XE#688]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][319] -> ([SKIP][320], [PASS][321]) ([Intel XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][322], [SKIP][323]) ([Intel XE#2322])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#1392])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][326] ([Intel XE#2322]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][327] ([Intel XE#1392]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     NOTRUN -> ([PASS][328], [SKIP][329]) ([Intel XE#1392]) +2 other tests ( 1 pass, 1 skip )
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][330] ([Intel XE#288])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][331] ([Intel XE#288]) +16 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][332], [SKIP][333]) ([Intel XE#288]) +10 other tests ( 2 skip )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][334], [SKIP][335]) ([Intel XE#2360])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][336] ([Intel XE#4045])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][337] ([Intel XE#586])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][338] ([Intel XE#1416])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][339] ([Intel XE#2457])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][340] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][341] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][344], [SKIP][345]) ([Intel XE#2541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#2838] / [Intel XE#979])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][347] ([Intel XE#1061])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][348], [SKIP][349]) ([Intel XE#2284] / [Intel XE#366])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][350] ([Intel XE#2284])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_pm@d3cold-mocs.html
    - shard-bmg:          NOTRUN -> [SKIP][351] ([Intel XE#2284])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][352] ([Intel XE#2284] / [Intel XE#366])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][353] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][354] -> [ABORT][355] ([Intel XE#1794])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_pm@s4-exec-after.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][356] -> [ABORT][357] ([Intel XE#1794])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> ([SKIP][358], [SKIP][359]) ([Intel XE#579])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][360], [SKIP][361]) ([Intel XE#944])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_query@multigpu-query-config.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][362] ([Intel XE#944])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_query@multigpu-query-engines.html
    - shard-bmg:          NOTRUN -> ([SKIP][363], [SKIP][364]) ([Intel XE#944])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_query@multigpu-query-engines.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][365] ([Intel XE#4130])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#3342])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][368] ([Intel XE#4273])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][369] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][371] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm:
    - shard-dg2-set2:     [INCOMPLETE][373] -> [PASS][374] +1 other test pass
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][375] ([Intel XE#3226]) -> ([PASS][376], [PASS][377])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#309]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][380] ([Intel XE#3226]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][382] ([Intel XE#2291]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#4302]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][386] ([Intel XE#1340]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][388] ([Intel XE#4173]) -> [PASS][389] +2 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][390] ([Intel XE#2316]) -> [PASS][391] +4 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#310]) -> ([PASS][393], [PASS][394]) +4 other tests ( 2 pass )
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_flip@2x-flip-vs-modeset.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][395] ([Intel XE#2316]) -> ([PASS][396], [PASS][397]) +3 other tests ( 2 pass )
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][398] ([Intel XE#3149] / [Intel XE#886]) -> ([PASS][399], [PASS][400])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][401] ([Intel XE#301]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][403] ([Intel XE#886]) -> ([PASS][404], [PASS][405]) +6 other tests ( 2 pass )
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:
    - shard-adlp:         [FAIL][406] ([Intel XE#2882]) -> [PASS][407] +3 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#656]) -> ([PASS][409], [PASS][410]) +3 other tests ( 2 pass )
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#656]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#455]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-set2:     [FAIL][415] ([Intel XE#4426]) -> ([PASS][416], [PASS][417])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_hdr@static-swap.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-swap@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][418] ([Intel XE#4426]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap@pipe-a-dp-4.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_hdr@static-swap@pipe-a-dp-4.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#4328]) -> ([PASS][421], [PASS][422])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [INCOMPLETE][423] -> ([PASS][424], [PASS][425])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_plane_lowres@tiling-x.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][426] ([Intel XE#2883]) -> ([PASS][427], [PASS][428])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#455]) -> ([PASS][430], [PASS][431]) +1 other test ( 2 pass )
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#1392]) -> [PASS][433] +1 other test pass
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1392]) -> ([PASS][435], [PASS][436]) +1 other test ( 2 pass )
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
    - shard-dg2-set2:     [FAIL][437] -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
    - shard-lnl:          [FAIL][439] ([Intel XE#3903]) -> ([PASS][440], [PASS][441])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
    - shard-adlp:         [FAIL][442] ([Intel XE#3903]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-8/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
    - shard-bmg:          [FAIL][444] ([Intel XE#3903]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][446] ([Intel XE#4541]) -> ([PASS][447], [PASS][448])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_oa@buffer-size.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@xe_oa@buffer-size.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][449] ([Intel XE#1794]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_pm@s4-mocs.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][451] ([Intel XE#3075] / [Intel XE#3084] / [Intel XE#4582]) -> ([PASS][452], [PASS][453])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][454] ([Intel XE#4543]) -> [DMESG-WARN][455] ([Intel XE#4173] / [Intel XE#4543])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#787]) -> ([SKIP][457], [SKIP][458]) ([Intel XE#455] / [Intel XE#787]) +8 other tests ( 2 skip )
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][460] ([Intel XE#787]) +4 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][462], [SKIP][463]) ([Intel XE#787])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#787]) -> [SKIP][465] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][466] ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][467], [INCOMPLETE][468]) ([Intel XE#2705])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#4418]) -> ([SKIP][470], [SKIP][471]) ([Intel XE#4418] / [Intel XE#4440])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][472] ([Intel XE#2341]) -> ([FAIL][473], [FAIL][474]) ([Intel XE#1178])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_content_protection@atomic.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@atomic.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [FAIL][475] ([Intel XE#1178]) -> ([FAIL][476], [SKIP][477]) ([Intel XE#1178] / [Intel XE#455])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_content_protection@atomic.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_content_protection@atomic.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][478] ([Intel XE#2341]) -> [FAIL][479] ([Intel XE#1188])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_content_protection@uevent.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][480] ([Intel XE#4302]) -> ([PASS][481], [SKIP][482]) ([Intel XE#4302])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][483] ([Intel XE#2316]) -> ([SKIP][484], [PASS][485]) ([Intel XE#2316])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][486] ([Intel XE#301]) -> [SKIP][487] ([Intel XE#310])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][488] ([Intel XE#301]) -> ([FAIL][489], [PASS][490]) ([Intel XE#301])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][491] ([Intel XE#3321]) -> ([FAIL][492], [PASS][493]) ([Intel XE#3321])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#310]) -> ([SKIP][495], [PASS][496]) ([Intel XE#310])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][497] ([Intel XE#301]) -> ([PASS][498], [FAIL][499]) ([Intel XE#301])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [INCOMPLETE][500] ([Intel XE#2049] / [Intel XE#2597]) -> ([INCOMPLETE][501], [PASS][502]) ([Intel XE#2049] / [Intel XE#2597])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][503] ([Intel XE#4543]) -> [DMESG-FAIL][504] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][505] ([Intel XE#2311]) -> ([SKIP][506], [SKIP][507]) ([Intel XE#2311] / [Intel XE#2312]) +9 other tests ( 2 skip )
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#656]) -> ([SKIP][509], [SKIP][510]) ([Intel XE#651] / [Intel XE#656]) +4 other tests ( 2 skip )
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][511] ([Intel XE#2312]) -> [SKIP][512] ([Intel XE#2311]) +6 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#651]) -> ([SKIP][514], [SKIP][515]) ([Intel XE#651] / [Intel XE#656]) +14 other tests ( 2 skip )
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][516] ([Intel XE#2312]) -> ([SKIP][517], [SKIP][518]) ([Intel XE#2311]) +2 other tests ( 2 skip )
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][519] ([Intel XE#2311]) -> ([SKIP][520], [SKIP][521]) ([Intel XE#2312])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#656]) -> ([SKIP][523], [SKIP][524]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][525] ([Intel XE#4141]) -> ([SKIP][526], [SKIP][527]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][528] ([Intel XE#2312]) -> ([SKIP][529], [SKIP][530]) ([Intel XE#4141])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#656]) -> ([SKIP][532], [PASS][533]) ([Intel XE#656])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][534] ([Intel XE#2312]) -> ([SKIP][535], [SKIP][536]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][537] ([Intel XE#2312]) -> [SKIP][538] ([Intel XE#4141]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][539] ([Intel XE#4141]) -> [SKIP][540] ([Intel XE#2312])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][541] ([Intel XE#4141]) -> ([SKIP][542], [SKIP][543]) ([Intel XE#2312])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#651]) -> ([SKIP][545], [SKIP][546]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][547] ([Intel XE#2311]) -> [SKIP][548] ([Intel XE#2312]) +5 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][549] ([Intel XE#2312]) -> ([SKIP][550], [SKIP][551]) ([Intel XE#2311] / [Intel XE#2312]) +6 other tests ( 2 skip )
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#651]) -> [SKIP][553] ([Intel XE#656]) +3 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#656]) -> [SKIP][555] ([Intel XE#651]) +3 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][556] ([Intel XE#2312]) -> ([SKIP][557], [SKIP][558]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#656]) -> ([SKIP][560], [SKIP][561]) ([Intel XE#653] / [Intel XE#656]) +6 other tests ( 2 skip )
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][562] ([Intel XE#2312]) -> [SKIP][563] ([Intel XE#2313]) +5 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][564] ([Intel XE#2313]) -> ([SKIP][565], [SKIP][566]) ([Intel XE#2312])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][567] ([Intel XE#2312]) -> ([SKIP][568], [SKIP][569]) ([Intel XE#2313]) +3 other tests ( 2 skip )
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#653]) -> ([SKIP][571], [SKIP][572]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][573] ([Intel XE#2313]) -> ([SKIP][574], [SKIP][575]) ([Intel XE#2312] / [Intel XE#2313]) +9 other tests ( 2 skip )
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#656]) -> ([SKIP][577], [SKIP][578]) ([Intel XE#653]) +6 other tests ( 2 skip )
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#653]) -> [SKIP][580] ([Intel XE#656]) +2 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#653]) -> ([SKIP][582], [SKIP][583]) ([Intel XE#653] / [Intel XE#656]) +10 other tests ( 2 skip )
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][584] ([Intel XE#2313]) -> [SKIP][585] ([Intel XE#2312]) +6 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#656]) -> [SKIP][587] ([Intel XE#653]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][588] ([Intel XE#3544]) -> ([SKIP][589], [SKIP][590]) ([Intel XE#3374] / [Intel XE#3544])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][591] ([Intel XE#4596]) -> [SKIP][592] ([Intel XE#2493])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [FAIL][593] ([Intel XE#2883]) -> ([PASS][594], [FAIL][595]) ([Intel XE#2883]) +1 other test ( 1 fail, 1 pass )
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_setmode@basic.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_setmode@basic.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][596] ([Intel XE#2426]) -> ([SKIP][597], [FAIL][598]) ([Intel XE#1729] / [Intel XE#2426])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#362]) -> ([FAIL][600], [SKIP][601]) ([Intel XE#1729] / [Intel XE#362])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][602] ([Intel XE#771]) -> ([FAIL][603], [FAIL][604]) ([Intel XE#771] / [Intel XE#899]) +2 other tests ( 2 fail )
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][605] ([Intel XE#771]) -> ([FAIL][606], [PASS][607]) ([Intel XE#899])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3903]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3903
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4346
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4582]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4582
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8289 -> IGTPW_12857
  * Linux: xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 -> xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def

  IGTPW_12857: 12857
  IGT_8289: 8289
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8
  xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def: 1e750490a76bbb8bcb8ea8d5fba2a68bf0845def

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/index.html

--===============7416931492483147626==
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
<tr><td><b>Series:</b></td><td>man/lsgpu: Add man page for lsgpu</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146860/">https://patchwork.freedesktop.org/series/146860/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8289_FULL -&gt; XEIGTPW_12857_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12857_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12857_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12857_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-2-degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_vrr@negative-basic@pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_vrr@negative-basic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_vrr@negative-basic.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12857_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +176 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_color@deep-color.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4346">Intel XE#4346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests ( 1 pass, 1 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_cursor_legacy@torture-bo.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_cursor_legacy@torture-bo.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_dp_aux_dev.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_dp_aux_dev.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-8/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-9/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@xe_eudebug@basic-connect.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_eudebug@basic-connect.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_eudebug_online@pagefault-read.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@xe_eudebug_online@pagefault-read.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_query@multigpu-query-config.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@xe_query@multigpu-query-engines.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@xe_query@multigpu-query-engines.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a>) +6 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Intel XE#4426</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_hdr@static-swap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_hdr@static-swap.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Intel XE#4426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_hdr@static-swap@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html">INCOMPLETE</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_plane_lowres@tiling-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3903">Intel XE#3903</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">PASS</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3903">Intel XE#3903</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-8/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3903">Intel XE#3903</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_oa@buffer-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@xe_oa@buffer-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@xe_oa@buffer-size.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4582">Intel XE#4582</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_content_protection@atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-3/igt@kms_setmode@basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-5/igt@kms_setmode@basic.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8289 -&gt; IGTPW_12857</li>
<li>Linux: xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 -&gt; xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def</li>
</ul>
<p>IGTPW_12857: 12857<br />
  IGT_8289: 8289<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8<br />
  xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def: 1e750490a76bbb8bcb8ea8d5fba2a68bf0845def</p>

</body>
</html>

--===============7416931492483147626==--
