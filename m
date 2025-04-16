Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62016C369C2
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 22:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B61710E9DC;
	Wed, 16 Apr 2025 22:47:53 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4910E9DC;
 Wed, 16 Apr 2025 22:47:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8201971543302719761=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fjoiner?=
 =?utf-8?q?=3A_Fix_mode_handling_invalid_joiner_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Apr 2025 22:47:52 -0000
Message-ID: <174484367205.11696.715092275744953123@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
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

--===============8201971543302719761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Fix mode handling invalid joiner subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/147574/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8323_FULL -> XEIGTPW_12987_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12987_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12987_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12987_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][5] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][6] -> [DMESG-FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_lease@master-vs-lease:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_lease@master-vs-lease.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_lease@master-vs-lease.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-436/igt@xe_vm@bind-array-enobufs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][13] ([Intel XE#2321]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][15] ([Intel XE#2316]) -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12987_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@overlay-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4761])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_async_flips@overlay-atomic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#4761])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_async_flips@overlay-atomic.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1512])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +240 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +47 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#3862])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4440])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4417]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#4416]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2252]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2325])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3278])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1178]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2320])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#308]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2321])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#309]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2291]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#309]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#1475])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#323])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#3009])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-436/igt@kms_dp_aux_dev.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#4294])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#776])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1137])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][73] ([Intel XE#2882]) +5 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][74] ([Intel XE#3428])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2316]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#310]) +12 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#3321]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2316]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1421]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#310])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> [FAIL][85] ([Intel XE#2882]) +4 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][86] -> [DMESG-FAIL][87] ([Intel XE#3428])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#886]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#301]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#301])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][95] -> [INCOMPLETE][96] ([Intel XE#2049]) +1 other test incomplete
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-433/igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1397] / [Intel XE#1745])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#455]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2311]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4141]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#656]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#656]) +7 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#651]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#651]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#656]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2313]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#653]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#605])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#605])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#1503]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_hdr@static-swap.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2927])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#599]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#4596])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#4596])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][123] ([Intel XE#4502] / [Intel XE#4760])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2763]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2763]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#870])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#718]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1129])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#836])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-4:
    - shard-bmg:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#3428]) +13 other tests dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-4.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-4.html

  * igt@kms_properties@plane-properties-atomic@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][134] ([Intel XE#3428])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_properties@plane-properties-atomic@pipe-d-dp-2.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1489]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2893] / [Intel XE#4608])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4608])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#1489]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1128])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1406]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#4609])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2414])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2939])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#3414])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][148] -> [SKIP][149] ([Intel XE#1435])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [PASS][150] -> [SKIP][151] ([Intel XE#455])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1091] / [Intel XE#2849])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1126])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2905]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug@vma-ufence:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#2905]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2905]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#4518])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#688])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#1392]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][160] -> [SKIP][161] ([Intel XE#1392]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1392]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2322]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#288]) +15 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#560])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_media_fill@media-fill.html
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#560])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_oa@disabled-read-error.html
    - shard-lnl:          NOTRUN -> [FAIL][168] ([Intel XE#4809])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@enable-disable@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][169] ([Intel XE#4804])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@xe_oa@enable-disable@ccs-0.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#2248])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@polling-small-buf:
    - shard-lnl:          NOTRUN -> [FAIL][171] ([Intel XE#4810])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#2284] / [Intel XE#366])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          [PASS][174] -> [FAIL][175] ([Intel XE#2142])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@xe_pm@d3hot-mocs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][176] -> [ABORT][177] ([Intel XE#1794])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-8/igt@xe_pm@s4-basic.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#4733])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#4733])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#944])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#944])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#944]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#4130])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#4130])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_vm@large-userptr-split-binds-8388608:
    - shard-lnl:          [PASS][185] -> [ABORT][186] ([Intel XE#4624])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-5/igt@xe_vm@large-userptr-split-binds-8388608.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@xe_vm@large-userptr-split-binds-8388608.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][187] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][189] ([Intel XE#827]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [INCOMPLETE][191] ([Intel XE#3225]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2:
    - shard-bmg:          [SKIP][193] -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_color@legacy-gamma-reset@pipe-a-dp-2.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_color@legacy-gamma-reset@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [FAIL][195] ([Intel XE#4808]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][197] ([Intel XE#2291]) -> [PASS][198] +2 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#309]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-lnl:          [ABORT][201] ([Intel XE#4624]) -> [PASS][202] +2 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-6/igt@kms_cursor_legacy@single-bo.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-lnl:          [DMESG-FAIL][203] -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_cursor_legacy@single-bo@pipe-c:
    - shard-lnl:          [FAIL][205] -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-c.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-c.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][207] ([Intel XE#4354]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][209] ([Intel XE#2373]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][211] -> [PASS][212] +5 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-dp2-hdmi-a3.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][213] ([Intel XE#3321]) -> [PASS][214] +4 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#3428]) -> [PASS][216] +6 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#310]) -> [PASS][218] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][219] ([Intel XE#2316]) -> [PASS][220] +4 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@modeset-vs-vblank-race@a-dp2:
    - shard-bmg:          [FAIL][221] ([Intel XE#2882]) -> [PASS][222] +6 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#656]) -> [PASS][224] +6 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#616]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#836]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][229] ([Intel XE#1435]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1392]) -> [PASS][232] +8 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][233] ([Intel XE#3876]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [INCOMPLETE][235] ([Intel XE#2594]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-7/igt@xe_module_load@many-reload.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          [WARN][237] -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][239] ([Intel XE#1794]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#787]) -> [SKIP][242] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][244] ([Intel XE#787]) +8 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][245] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][246] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][247] ([Intel XE#1178]) -> [SKIP][248] ([Intel XE#2341]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-1/igt@kms_content_protection@legacy.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][249] ([Intel XE#1178]) -> [SKIP][250] ([Intel XE#455]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][251] ([Intel XE#1188]) -> [SKIP][252] ([Intel XE#2341])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_content_protection@uevent.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [FAIL][253] -> [SKIP][254] ([Intel XE#4354])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][255] ([Intel XE#2316]) -> [FAIL][256] ([Intel XE#886])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][257] ([Intel XE#3321]) -> [SKIP][258] ([Intel XE#2316])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][259] ([Intel XE#2316]) -> [FAIL][260] ([Intel XE#2882])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][261] ([Intel XE#886]) -> [FAIL][262] ([Intel XE#3149] / [Intel XE#886])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][263] ([Intel XE#2312]) -> [SKIP][264] ([Intel XE#4141]) +8 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#4141]) -> [SKIP][266] ([Intel XE#2312]) +9 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [SKIP][268] ([Intel XE#2311]) +17 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2311]) -> [SKIP][270] ([Intel XE#2312]) +16 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#656]) -> [SKIP][272] ([Intel XE#651]) +10 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#651]) -> [SKIP][274] ([Intel XE#656]) +16 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#656]) -> [SKIP][276] ([Intel XE#653]) +12 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#2313]) -> [SKIP][278] ([Intel XE#2312]) +12 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][279] ([Intel XE#2312]) -> [SKIP][280] ([Intel XE#2313]) +15 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#653]) -> [SKIP][282] ([Intel XE#656]) +15 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#4596]) -> [SKIP][284] ([Intel XE#455])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][285] ([Intel XE#4760]) -> [ABORT][286] ([Intel XE#2705] / [Intel XE#4760])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][287] ([Intel XE#2763]) -> [INCOMPLETE][288] ([Intel XE#2566]) +1 other test incomplete
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][289] ([Intel XE#2426]) -> [SKIP][290] ([Intel XE#2509])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1500]) -> [SKIP][292] ([Intel XE#362])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8323/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4761
  [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
  [Intel XE#4808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4808
  [Intel XE#4809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4809
  [Intel XE#4810]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4810
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8323 -> IGTPW_12987

  IGTPW_12987: 12987
  IGT_8323: 09df30b83439380ed9b7f76d31c38d08e31a450c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2961-e38369229d42b6f201130d0ab3a549ab814caa0e: e38369229d42b6f201130d0ab3a549ab814caa0e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/index.html

--===============8201971543302719761==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Fix mode handling in=
valid joiner subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147574/">https://patchwork.freedesktop.org/series/147574/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12987/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8323_FULL -&gt; XEIGTPW_12987_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12987_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12987_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
987_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe=
-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-=
bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-b=
mg-6/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible@ab-dp2-hdmi-a3.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@master-vs-lease:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_lease@master-vs-lease.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6=
/igt@kms_lease@master-vs-lease.html">DMESG-WARN</a> +2 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_render_copy@render-stress-0=
-copies.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-436/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-=
464/igt@xe_vm@bind-array-enobufs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">=
Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12987/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12987_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@overlay-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_async_flips@overlay-atomic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4761">Intel XE#4761</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_async_flips@overlay-atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4761">Intel XE#4761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12987/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_bw@connected-linear-tiling=
-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_bw@linear-tiling-3-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +240 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12987/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@kms_ccs@random-ccs-data-y-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_cdclk@mode-transition-all-=
outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-edi=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-t=
imings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_chamelium_edid@hdmi-mode-tim=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12987/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-ato=
mic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other=
 tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12987/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-436/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@km=
s_dp_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987=
/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4=
294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_feature_discovery@dp-mst.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/=
igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12987/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12987/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +4 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e@c-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12987/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12987/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1298=
7/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">In=
tel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-433/igt@kms_flip@modeset-vs-vblank-race-interruptible@=
d-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_flip@modeset-vs-vblank-race-inte=
rruptible@d-hdmi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 oth=
er tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
05">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@k=
ms_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shar=
d-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-d=
g2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_properties@connector-properties-atomic@pipe-=
none-hdmi-a-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_properties@connector-propertie=
s-atomic@pipe-none-hdmi-a-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +13 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_properties@plane-properties-=
atomic@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-on=
off@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_psr@psr2-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987=
/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12987/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-dest=
roy-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-3/igt@xe_eudebug@vma-ufence.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">=
Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_eudebug_online@debugger-reo=
pen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@xe_evict@evict-beng-large-extern=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12987/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@xe_exec_fault_mode@many-execqu=
eues-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_oa@disabled-read-error.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-8/igt@xe_oa@disabled-read-error.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/48=
09">Intel XE#4809</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@xe_oa@enable-disable@ccs-0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
804">Intel XE#4804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-1/igt@xe_oa@polling-small-buf.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4810=
">Intel XE#4810</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_oa@syncs-userptr-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@xe_pm@d3hot-mocs.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@xe_p=
m@d3hot-mocs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2142">Intel XE#2142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-lnl-2/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@xe_pxp@pxp-src-to-pxp-dest-rende=
rcopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@xe_pxp@pxp-termination-key-upd=
ate-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_query@multigpu-query-hwconf=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-7/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@xe_sriov_auto_provisioning@sel=
fconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-8388608:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-5/igt@xe_vm@large-userptr-split-binds-8388608.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
87/shard-lnl-6/igt@xe_vm@large-userptr-split-binds-8388608.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel=
 XE#4624</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3701">Intel XE#3701</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic=
@pipe-d-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_async_flips@alterna=
te-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
25">Intel XE#3225</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12987/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_color@legacy-gamma-reset@pipe-a-dp-2.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
987/shard-bmg-7/igt@kms_color@legacy-gamma-reset@pipe-a-dp-2.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
808">Intel XE#4808</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12987/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-ato=
mic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12987/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legac=
y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12987/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-tog=
gle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-6/igt@kms_cursor_legacy@single-bo.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#=
4624</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12987/shard-lnl-6/igt@kms_cursor_legacy@single-bo.html">PASS</a> +2 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-F=
AIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
987/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-c.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/sh=
ard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-c.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12987/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12987/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank@ad-dp2-h=
dmi-a3.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12987/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank@a=
d-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12987/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ac-dp=
2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">In=
tel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12987/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12987/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">=
Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12987/shard-bmg-2/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html">=
PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +6 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a=
-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel =
XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12987/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12987/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_exec_basi=
c@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +8 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidat=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@xe_exec_threads@threads-=
hang-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-7/igt@xe_module_load@many-reload.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel=
 XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12987/shard-bmg-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@xe_pm@s4-d3hot-basic-exec.html">WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3=
/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-ln=
l-8/igt@xe_pm@s4-mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_ccs@bad-rotatio=
n-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12987/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12987/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12987/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">FAIL</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-b=
mg-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-inte=
rruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12987/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">In=
tel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12987/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblan=
k-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-8/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-433/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sh=
rfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12987/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760=
">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12987/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12987/shard-bmg-3/igt@kms_plane_scali=
ng@planes-upscale-factor-0-25-downscale-factor-0-75.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel X=
E#2566</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12987/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8323/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12987/shard-dg2-464/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8323 -&gt; IGTPW_12987</li>
</ul>
<p>IGTPW_12987: 12987<br />
  IGT_8323: 09df30b83439380ed9b7f76d31c38d08e31a450c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2961-e38369229d42b6f201130d0ab3a549ab814caa0e: e38369229d42b6f201130d0=
ab3a549ab814caa0e</p>

</body>
</html>

--===============8201971543302719761==--
