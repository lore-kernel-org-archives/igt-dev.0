Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105EDD75E49
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 13:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85A710EB8B;
	Fri, 22 Nov 2024 13:51:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A05D10EB8B;
 Fri, 22 Nov 2024 13:51:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7977086042013518555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fcdclk=3A?=
 =?utf-8?q?_Handle_scenario_where_ref_and_new_cdclk_is_same?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 13:51:40 -0000
Message-ID: <173228350037.1710767.2722981786250299083@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121174659.1752109-1-swati2.sharma@intel.com>
In-Reply-To: <20241121174659.1752109-1-swati2.sharma@intel.com>
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

--===============7977086042013518555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_cdclk: Handle scenario where ref and new cdclk is same
URL   : https://patchwork.freedesktop.org/series/141672/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8121_full -> XEIGTPW_12166_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12166_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12166_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12166_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#2136]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][9] ([Intel XE#3421]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12166_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [PASS][11] -> [FAIL][12] ([Intel XE#3440])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@core_getversion@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#1885])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#3249])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#3339])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][19] -> [SKIP][20] ([Intel XE#2134]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@fbdev@eof.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@fbdev@eof.html

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2134])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@fbdev@info.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-bmg:          [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2550]) +23 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#2423] / [i915#2575]) +125 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2136]) +44 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][29] ([Intel XE#3162])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2327])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1407])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2887])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#787]) +125 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#314]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#373]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2252]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#1178])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2321])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][53] ([Intel XE#3468]) +4 other tests dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#3226])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2291]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#2423] / [i915#2575]) +15 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#877])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#309]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2244])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2316]) +10 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#2882]) +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#3321])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#3321] / [Intel XE#3487])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3468]) +93 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#886]) +4 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][75] ([Intel XE#1727] / [Intel XE#3468])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#455]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#656]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#2333]) +3 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2313])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#3012])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2934])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2927])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2486])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2763]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2763] / [Intel XE#455])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][92] ([Intel XE#1727])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2392])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#3184]) +1 other test dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][96] ([Intel XE#1727] / [Intel XE#3468])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#2446]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2893]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1489]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1489])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2136]) +16 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#3414]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#3414]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2413] / [Intel XE#374])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#374]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#899])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-bmg:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [PASS][113] -> [DMESG-FAIL][114] ([Intel XE#3468]) +13 other tests dmesg-fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_vblank@wait-busy-hang.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#2142]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][117] ([Intel XE#3468]) +6 other tests dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1280] / [Intel XE#455])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2905]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2905])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2905]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][122] -> [FAIL][123] ([Intel XE#1000])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-cm:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#688]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-5/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][125] -> [SKIP][126] ([Intel XE#1130]) +227 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2322]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#288]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][129] -> [DMESG-WARN][130] ([Intel XE#2687] / [Intel XE#3371])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#3343]) +1 other test dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#3467])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3467] / [Intel XE#3468])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [PASS][137] -> [DMESG-WARN][138] ([Intel XE#3343] / [Intel XE#3468])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][139] ([Intel XE#3467])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1130]) +22 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_intel_bb@blit-reloc:
    - shard-dg2-set2:     [PASS][141] -> [DMESG-WARN][142] ([Intel XE#1727])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_intel_bb@blit-reloc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_intel_bb@blit-reloc.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#2229]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][145] -> [SKIP][146] ([Intel XE#1192])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2457])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][148] -> [FAIL][149] ([Intel XE#3546])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@many-reload.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_module_load@many-reload.html
    - shard-lnl:          [PASS][150] -> [DMESG-WARN][151] ([Intel XE#3560])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_module_load@many-reload.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-4/igt@xe_module_load@many-reload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][152] -> [FAIL][153] ([Intel XE#2249])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          [PASS][154] -> [FAIL][155] ([Intel XE#2249])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][156] ([Intel XE#2249])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][157] ([Intel XE#2249])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-bmg:          [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1727]) +2 other tests dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_oa@privileged-forked-access-vaddr.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@privileged-forked-access-vaddr@ccs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][160] ([Intel XE#1727])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_oa@privileged-forked-access-vaddr@ccs-0.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2248])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][162] ([Intel XE#1173])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][163] -> [DMESG-WARN][164] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][165] -> [ABORT][166] ([Intel XE#1794]) +1 other test abort
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#3342])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#3342])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [DMESG-WARN][169] ([Intel XE#3468]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-lnl:          [DMESG-WARN][171] -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2134]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@fbdev@unaligned-read.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][175] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][177] ([Intel XE#2291]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][179] ([Intel XE#3070]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][181] ([Intel XE#2316]) -> [PASS][182] +4 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][183] ([Intel XE#3321] / [Intel XE#3487]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][185] ([Intel XE#2882]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][187] ([Intel XE#301]) -> [PASS][188] +4 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][189] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][191] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-dg2-set2:     [DMESG-WARN][193] ([Intel XE#1727]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_force_connector_basic@force-edid.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][196] +8 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [INCOMPLETE][197] ([Intel XE#1727]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#2136]) -> [PASS][200] +18 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][201] ([Intel XE#1503]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2423] / [i915#2575]) -> [PASS][204] +91 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_lease@invalid-create-leases.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#877]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_plane_cursor@viewport:
    - shard-bmg:          [DMESG-FAIL][207] ([Intel XE#3468]) -> [PASS][208] +3 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][209] ([Intel XE#2571]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][211] ([Intel XE#1430]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2446]) -> [PASS][214] +3 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-lnl:          [DMESG-WARN][215] ([Intel XE#3184]) -> [PASS][216] +2 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][217] ([Intel XE#899]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][220] +2 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][221] ([Intel XE#3468]) -> [PASS][222] +39 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@xe_exercise_blt@fast-copy:
    - shard-bmg:          [INCOMPLETE][223] -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][225] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][227] ([Intel XE#3467]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][229] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][231] ([Intel XE#2514]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][233] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_pm@s4-basic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-5/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][235] ([Intel XE#958]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1130]) -> [PASS][238] +139 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [INCOMPLETE][239] ([Intel XE#3468]) -> [DMESG-WARN][240] ([Intel XE#3468])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][242] ([Intel XE#316])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136]) -> [SKIP][244] ([Intel XE#316]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#316]) -> [SKIP][246] ([Intel XE#2136]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136]) -> [SKIP][248] ([Intel XE#1124]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#610])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#607]) -> [SKIP][252] ([Intel XE#2136])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1124]) -> [SKIP][254] ([Intel XE#2136]) +11 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1124]) -> [SKIP][256] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][258] ([Intel XE#1124]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2423] / [i915#2575]) -> [SKIP][260] ([Intel XE#367]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [SKIP][262] ([Intel XE#2191])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2191]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#367]) -> [SKIP][266] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][268] ([Intel XE#2136]) +16 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136]) -> [SKIP][270] ([Intel XE#2907]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136]) -> [SKIP][272] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][274] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#3442]) -> [SKIP][276] ([Intel XE#2136])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][278] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2907]) -> [SKIP][280] ([Intel XE#2136]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2423] / [i915#2575]) -> [SKIP][282] ([Intel XE#306]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#306]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2423] / [i915#2575]) -> [SKIP][286] ([Intel XE#373]) +9 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#373]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][289] ([Intel XE#1178]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_content_protection@atomic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][291] ([Intel XE#2341]) -> [FAIL][292] ([Intel XE#1178])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#307]) -> [SKIP][294] ([Intel XE#2423] / [i915#2575])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [SKIP][296] ([Intel XE#307])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][297] ([Intel XE#1178]) -> [SKIP][298] ([Intel XE#2341]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_content_protection@legacy.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][299] ([Intel XE#2341]) -> [DMESG-FAIL][300] ([Intel XE#3468])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@uevent.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#308]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#323]) -> [SKIP][304] ([Intel XE#2423] / [i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][305] ([Intel XE#877]) -> [SKIP][306] ([Intel XE#2291])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#323])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [FAIL][309] ([Intel XE#1695]) -> [DMESG-FAIL][310] ([Intel XE#3468])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2136]) -> [SKIP][312] ([Intel XE#776])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#776]) -> [SKIP][314] ([Intel XE#2136])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#703]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1138]) -> [SKIP][318] ([Intel XE#2423] / [i915#2575])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1137]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][321] ([Intel XE#2882]) -> [SKIP][322] ([Intel XE#2316])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2-set2:     [DMESG-WARN][323] ([Intel XE#1727]) -> [SKIP][324] ([Intel XE#2136])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136]) -> [INCOMPLETE][326] ([Intel XE#1727] / [Intel XE#3468])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#455]) -> [SKIP][328] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#455]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#455]) -> [SKIP][332] ([Intel XE#2136]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [SKIP][334] ([i915#5274])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][335] ([Intel XE#2312]) -> [SKIP][336] ([Intel XE#2311]) +14 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2136]) -> [SKIP][338] ([Intel XE#651]) +17 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][340] ([Intel XE#651]) +7 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][341] ([Intel XE#3468]) -> [FAIL][342] ([Intel XE#2333]) +1 other test fail
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][343] ([Intel XE#2333]) -> [INCOMPLETE][344] ([Intel XE#1727] / [Intel XE#3468])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][345] ([Intel XE#2312]) -> [DMESG-FAIL][346] ([Intel XE#3468]) +1 other test dmesg-fail
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][347] ([Intel XE#2312]) -> [FAIL][348] ([Intel XE#2333]) +5 other tests fail
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2136]) -> [ABORT][350] ([Intel XE#3468])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][351] ([Intel XE#2333]) -> [DMESG-FAIL][352] ([Intel XE#3468]) +12 other tests dmesg-fail
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][353] ([Intel XE#3468]) -> [SKIP][354] ([Intel XE#2312]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][355] ([Intel XE#2333]) -> [SKIP][356] ([Intel XE#2312]) +8 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [FAIL][357] ([Intel XE#2333]) -> [INCOMPLETE][358] ([Intel XE#1727])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][359] ([Intel XE#2311]) -> [SKIP][360] ([Intel XE#2312]) +19 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#651]) -> [SKIP][362] ([Intel XE#2136]) +27 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#651]) -> [SKIP][364] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#653]) -> [SKIP][366] ([Intel XE#2136]) +33 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#653]) -> [SKIP][368] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][369] ([Intel XE#2312]) -> [SKIP][370] ([Intel XE#2313]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][372] ([Intel XE#653]) +7 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136]) -> [SKIP][374] ([Intel XE#653]) +21 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][375] ([Intel XE#2313]) -> [SKIP][376] ([Intel XE#2312]) +17 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][377] ([Intel XE#3544]) -> [SKIP][378] ([Intel XE#3374] / [Intel XE#3544])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#455]) -> [SKIP][380] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#346]) -> [SKIP][382] ([Intel XE#2136]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2136]) -> [SKIP][384] ([Intel XE#2925])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2136]) -> [SKIP][386] ([Intel XE#2927])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2423] / [i915#2575]) -> [SKIP][388] ([Intel XE#455]) +6 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_panel_fitting@legacy.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2423] / [i915#2575]) -> [SKIP][390] ([Intel XE#2763] / [Intel XE#455])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][392] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][394] ([Intel XE#1727] / [Intel XE#2566])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2938]) -> [SKIP][396] ([Intel XE#2136])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][398] ([Intel XE#1122])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2136]) -> [SKIP][400] ([Intel XE#1129])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#3309])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1129]) -> [SKIP][404] ([Intel XE#2136] / [Intel XE#2351])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#908]) -> [SKIP][406] ([Intel XE#2136])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2446]) -> [ABORT][408] ([Intel XE#3468])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [ABORT][409] ([Intel XE#3468]) -> [SKIP][410] ([Intel XE#2446])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#1489]) +5 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1489]) -> [SKIP][414] ([Intel XE#2136]) +9 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#1122])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2136]) -> [SKIP][418] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][420] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][422] ([Intel XE#2136]) +13 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][424] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][426] ([Intel XE#2351]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#2939])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1127]) -> [SKIP][430] ([Intel XE#2423] / [i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2423] / [i915#2575]) -> [SKIP][432] ([Intel XE#3414]) +3 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2423] / [i915#2575]) -> [SKIP][434] ([Intel XE#1127])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#3414]) -> [SKIP][436] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][437] ([Intel XE#2426]) -> [FAIL][438] ([Intel XE#1729])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#362]) -> [SKIP][440] ([Intel XE#2423] / [i915#2575])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2423] / [i915#2575]) -> [SKIP][442] ([Intel XE#1500])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-dg2-set2:     [DMESG-WARN][443] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][444] ([Intel XE#2423] / [i915#2575])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2168]) -> [SKIP][446] ([Intel XE#2423] / [i915#2575])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_vrr@lobf.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2423] / [i915#2575]) -> [SKIP][448] ([Intel XE#756])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#756]) -> [SKIP][450] ([Intel XE#2423] / [i915#2575])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][452] ([Intel XE#1130])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1130]) -> [SKIP][454] ([Intel XE#1280] / [Intel XE#455])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1130]) -> [SKIP][456] ([Intel XE#1123])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1126]) -> [SKIP][458] ([Intel XE#1130])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2905]) -> [SKIP][460] ([Intel XE#1130]) +15 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_eudebug@basic-close.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1130]) -> [SKIP][462] ([Intel XE#2905]) +11 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [FAIL][463] ([Intel XE#2364]) -> [DMESG-FAIL][464] ([Intel XE#3468])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-dg2-set2:     [FAIL][465] ([Intel XE#1600]) -> [SKIP][466] ([Intel XE#1130])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][467] ([Intel XE#1727]) -> [SKIP][468] ([Intel XE#1130])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#288]) -> [SKIP][470] ([Intel XE#1130]) +34 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1130]) -> [SKIP][472] ([Intel XE#288]) +26 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2360]) -> [SKIP][474] ([Intel XE#1130])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1130]) -> [DMESG-WARN][476] ([Intel XE#1727])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][477] ([Intel XE#3371] / [Intel XE#3515]) -> [DMESG-WARN][478] ([Intel XE#3515])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [DMESG-WARN][479] ([Intel XE#1727] / [Intel XE#3343]) -> [SKIP][480] ([Intel XE#1130])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][481] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][482] ([Intel XE#3343])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [DMESG-WARN][483] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][484] ([Intel XE#3467])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [DMESG-WARN][486] ([Intel XE#3343]) +1 other test dmesg-warn
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [DMESG-WARN][487] ([Intel XE#3467]) -> [SKIP][488] ([Intel XE#1130]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][489] ([Intel XE#3499]) -> [DMESG-FAIL][490] ([Intel XE#3467] / [Intel XE#3468])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][491] ([Intel XE#3521]) -> [DMESG-WARN][492] ([Intel XE#3467] / [Intel XE#3468])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1130]) -> [DMESG-WARN][494] ([Intel XE#3467])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-WARN][495] ([Intel XE#3467]) -> [FAIL][496] ([Intel XE#3546])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#3573]) +9 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#3573]) -> [SKIP][500] ([Intel XE#1130]) +12 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1337]) -> [SKIP][502] ([Intel XE#1130])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1130]) -> [SKIP][504] ([Intel XE#977])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][506] ([Intel XE#1130])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1061]) -> [FAIL][508] ([Intel XE#1173])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_peer2peer@read.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][510] ([Intel XE#1130])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_pm@d3cold-basic.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1130]) -> [SKIP][512] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#1130]) -> [DMESG-WARN][514] ([Intel XE#3468])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@d3hot-multiple-execs.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [DMESG-WARN][515] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][516] ([Intel XE#1130])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@s3-mocs.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][517] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][518] ([Intel XE#3468] / [Intel XE#569])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1130]) -> [DMESG-WARN][520] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [DMESG-WARN][521] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [SKIP][522] ([Intel XE#1130])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s4-mocs.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#944]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#944]) -> [SKIP][526] ([Intel XE#1130]) +6 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#1130]) -> [ABORT][528] ([Intel XE#3421])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [ABORT][530] ([Intel XE#3075] / [Intel XE#3084])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3560
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8121 -> IGTPW_12166
  * Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -> xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199

  IGTPW_12166: 12166
  IGT_8121: 8121
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/index.html

--===============7977086042013518555==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_cdclk: Handle scenario where ref and new cdclk is same</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141672/">https://patchwork.freedesktop.org/series/141672/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8121_full -&gt; XEIGTPW_12166_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12166_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12166_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12166_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12166_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +93 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_vblank@wait-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +13 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-5/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +227 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-reloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_intel_bb@blit-reloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_intel_bb@blit-reloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-4/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3560">Intel XE#3560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_oa@privileged-forked-access-vaddr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_oa@privileged-forked-access-vaddr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_oa@privileged-forked-access-vaddr@ccs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_force_connector_basic@force-edid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_lease@invalid-create-leases.html">PASS</a> +91 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_plane_cursor@viewport.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-5/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +139 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +12 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_pm_rpm@dpms-lpsp.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521">Intel XE#3521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@d3hot-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-434/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_pm@s4-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12166/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8121 -&gt; IGTPW_12166</li>
<li>Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -&gt; xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199</li>
</ul>
<p>IGTPW_12166: 12166<br />
  IGT_8121: 8121<br />
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380<br />
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199</p>

</body>
</html>

--===============7977086042013518555==--
