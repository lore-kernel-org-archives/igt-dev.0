Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E0CDE03A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 21:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240A010E21A;
	Thu, 26 Sep 2024 21:15:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2395910E21A;
 Thu, 26 Sep 2024 21:14:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3811656907321884119=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv4=2C1/2=5D_tests/kms=5Fasync=5Fflips=3A_subtests_to_validate_?=
 =?utf-8?q?async_flips_on_atomic_path_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 21:14:59 -0000
Message-ID: <172738529912.1108926.11286554244456244120@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
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

--===============3811656907321884119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/2] tests/kms_async_flips: subtests to validate async flips on atomic path (rev4)
URL   : https://patchwork.freedesktop.org/series/137825/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8032_full -> XEIGTPW_11802_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11802_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11802_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11802_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x (NEW):
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][1] +12 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x.html

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-2 (NEW):
    - {shard-bmg}:        NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-b-dp-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2 (NEW):
    - {shard-bmg}:        NOTRUN -> [DMESG-FAIL][3] +5 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@invalid-async-flip-atomic (NEW):
    - {shard-bmg}:        NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][5] +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +54 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][10] +2 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][11] -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][14] ([Intel XE#1430]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][16] ([Intel XE#1201]) -> [SKIP][17] +24 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@hotreplug-lateclose:
    - {shard-bmg}:        [ABORT][18] -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - {shard-bmg}:        [SKIP][20] ([Intel XE#2370]) -> [SKIP][21] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - {shard-bmg}:        [SKIP][22] ([Intel XE#2327]) -> [SKIP][23] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-bmg}:        [PASS][24] -> [SKIP][25] +137 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-bmg}:        [FAIL][26] ([Intel XE#1659]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - {shard-bmg}:        [SKIP][28] ([Intel XE#1124]) -> [SKIP][29] +14 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#367]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - {shard-bmg}:        [SKIP][32] ([Intel XE#2251]) -> [SKIP][33] +22 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        [SKIP][34] ([Intel XE#2724]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - {shard-bmg}:        [SKIP][36] ([Intel XE#2325]) -> [SKIP][37] +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - {shard-bmg}:        [SKIP][38] ([Intel XE#2252]) -> [SKIP][39] +12 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - {shard-bmg}:        [FAIL][40] ([Intel XE#1178]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_content_protection@atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - {shard-bmg}:        [SKIP][42] ([Intel XE#2320]) -> [SKIP][43] +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - {shard-bmg}:        [DMESG-WARN][44] -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dsc@dsc-with-output-formats:
    - {shard-bmg}:        [SKIP][46] ([Intel XE#2244]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - {shard-bmg}:        [FAIL][48] ([Intel XE#1695]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - {shard-bmg}:        [SKIP][50] ([Intel XE#2380]) -> [SKIP][51] +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - {shard-bmg}:        [SKIP][52] ([Intel XE#2311]) -> [SKIP][53] +38 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - {shard-bmg}:        NOTRUN -> [FAIL][54]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - {shard-bmg}:        [FAIL][55] -> [SKIP][56] +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - {shard-bmg}:        [FAIL][57] ([Intel XE#2333]) -> [INCOMPLETE][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - {shard-bmg}:        [FAIL][59] ([Intel XE#2333]) -> [SKIP][60] +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - {shard-bmg}:        [SKIP][61] ([Intel XE#2352]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - {shard-bmg}:        NOTRUN -> [SKIP][63] +29 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - {shard-bmg}:        [SKIP][64] ([Intel XE#2312]) -> [SKIP][65] +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - {shard-bmg}:        [SKIP][66] ([Intel XE#2350]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - {shard-bmg}:        [SKIP][68] ([Intel XE#2313]) -> [SKIP][69] +34 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - {shard-bmg}:        [SKIP][70] ([Intel XE#2501]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - {shard-bmg}:        [SKIP][72] ([Intel XE#2486]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_panel_fitting@legacy.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-yf:
    - {shard-bmg}:        [SKIP][74] ([Intel XE#2493]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - {shard-bmg}:        [SKIP][76] ([Intel XE#2763]) -> [SKIP][77] +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - {shard-bmg}:        [SKIP][78] ([Intel XE#1489]) -> [SKIP][79] +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr@psr-basic:
    - {shard-bmg}:        [SKIP][80] ([Intel XE#2850]) -> [SKIP][81] +20 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_psr@psr-basic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - {shard-bmg}:        [SKIP][82] ([Intel XE#2329]) -> [SKIP][83] +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - {shard-bmg}:        [SKIP][84] ([Intel XE#2413]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-none.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - {shard-bmg}:        [SKIP][86] ([Intel XE#1499]) -> [SKIP][87] +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - {shard-bmg}:        [SKIP][88] ([Intel XE#756]) -> [SKIP][89] +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - {shard-bmg}:        [PASS][90] -> [FAIL][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_pat@pat-index-xelpg:
    - {shard-bmg}:        [SKIP][92] ([Intel XE#2236]) -> [SKIP][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  
New tests
---------

  New tests have been introduced between XEIGT_8032_full and XEIGTPW_11802_full:

### New IGT tests (155) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - Statuses : 2 pass(s)
    - Exec time: [10.49, 19.16] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.98] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.93] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.95] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [32.11, 69.38] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-x:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-x:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-x:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-4-rc-ccs:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_async_flips@crc-atomic:
    - Statuses : 1 dmesg-fail(s) 2 pass(s)
    - Exec time: [10.47, 19.20] s

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.31] s

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [1.98] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.79] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.62] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [1.72] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@test-cursor-atomic:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.99] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@test-time-stamp-atomic:
    - Statuses : 2 pass(s)
    - Exec time: [3.16, 5.17] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11802_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201]) +31 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1407])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#316])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1124] / [Intel XE#1201])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1124])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1124]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#787]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#1252])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][104] -> [INCOMPLETE][105] ([Intel XE#1195] / [Intel XE#1727])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#373])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#373]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1424])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [PASS][111] -> [SKIP][112] ([Intel XE#1508])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@blocking-wf_vblank@c-edp1:
    - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#886]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@c-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_flip@blocking-wf_vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][115] -> [INCOMPLETE][116] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-dg2-set2:     [PASS][117] -> [INCOMPLETE][118] ([Intel XE#1195] / [Intel XE#2049])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_flip@modeset-vs-vblank-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][119] -> [INCOMPLETE][120] ([Intel XE#1195]) +2 other tests incomplete
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1401] / [Intel XE#1745])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1401])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1397] / [Intel XE#1745])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1397])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#656]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#651])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#651]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1201] / [Intel XE#455])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][132] -> [DMESG-FAIL][133] ([Intel XE#324]) +2 other tests dmesg-fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#324]) +2 other tests dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2763]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#870])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][138] -> [FAIL][139] ([Intel XE#1649]) +109 other tests fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [FAIL][140] ([Intel XE#1649]) +3 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1406])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#2850])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][143] -> [FAIL][144] ([Intel XE#899]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][145] -> [FAIL][146] ([Intel XE#2443]) +3 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][147] ([Intel XE#2443]) +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#756])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][149] ([Intel XE#1600])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1392])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#288])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][152] -> [TIMEOUT][153] ([Intel XE#2105])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [PASS][154] -> [FAIL][155] ([Intel XE#2249])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][157] -> [ABORT][158] ([Intel XE#1794])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@xe_pm@s4-mocs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@xe_pm@s4-mocs.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - {shard-bmg}:        [FAIL][159] ([Intel XE#1426]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][161] ([Intel XE#1426]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-bmg}:        [INCOMPLETE][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][165] ([Intel XE#1659]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][167] ([Intel XE#877]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][169] ([Intel XE#1616]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - {shard-bmg}:        [SKIP][171] -> [PASS][172] +4 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - {shard-bmg}:        [SKIP][173] ([Intel XE#2425]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][175] -> [PASS][176] +4 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][177] ([Intel XE#886]) -> [PASS][178] +3 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1195]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
    - shard-lnl:          [DMESG-WARN][181] ([Intel XE#324]) -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][183] ([Intel XE#324]) -> [PASS][184] +2 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#616]) -> [PASS][186] +3 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][187] -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][189] ([Intel XE#718]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][191] ([Intel XE#1473]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - {shard-bmg}:        [DMESG-WARN][193] ([Intel XE#569]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html
    - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#1195] / [Intel XE#569]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][197] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][199] ([Intel XE#1794]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][202] ([Intel XE#316]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#316]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#619]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#619])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#610]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#610])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1124]) -> [SKIP][210] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][212] ([Intel XE#1124]) +10 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][214] ([Intel XE#367]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2191]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#2191])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][218] ([Intel XE#2191]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#787]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][224] ([Intel XE#787]) +83 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][226] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][228] ([Intel XE#314])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#306]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#306])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][232] ([Intel XE#306]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_chamelium_color@gamma.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][234] ([Intel XE#373]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#373]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#307]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#307])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][240] ([Intel XE#308])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][242] ([Intel XE#323])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][244] ([Intel XE#701])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#455]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][248] ([Intel XE#651]) +20 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#651]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#658]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][254] ([Intel XE#653]) +25 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#653]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#653]) +14 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#455]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][260] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201]) -> [SKIP][262] ([Intel XE#2763]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +9 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2763]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#2763]) +8 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#2763]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201]) -> [SKIP][270] ([Intel XE#870])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#870]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1489]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#1489]) +14 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1489]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201]) -> [SKIP][280] ([Intel XE#2850]) +9 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2850]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#2850]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#2850]) +56 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#327]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][288] ([Intel XE#327]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][290] ([Intel XE#1127])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][292] ([Intel XE#455]) +19 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_vrr@flip-dpms.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#756]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#756])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#2849])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][298] ([Intel XE#288]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@xe_exec_fault_mode@many-basic.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#288]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][301] -> [SKIP][302] ([Intel XE#1201]) +13 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][304] ([Intel XE#2229])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201]) -> [SKIP][306] ([Intel XE#2541]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#2541]) +24 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1201]) -> [SKIP][310] ([Intel XE#1201] / [Intel XE#977])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][312] ([Intel XE#366])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@xe_pm@d3cold-basic.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#366]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#366])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11802
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1977-0c981c182e22df4e1a25cd80f756b5824586e51e

  IGTPW_11802: 6814ac32e3f9c11f498855c3694a2ac640b127b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1977-0c981c182e22df4e1a25cd80f756b5824586e51e: 0c981c182e22df4e1a25cd80f756b5824586e51e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/index.html

--===============3811656907321884119==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/2] tests/kms_async_flips: subtests to validate async flips on atomic path (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137825/">https://patchwork.freedesktop.org/series/137825/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_full -&gt; XEIGTPW_11802_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11802_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11802_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11802_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x.html">DMESG-WARN</a> +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-2 (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-b-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2 (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html">DMESG-FAIL</a> +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +54 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +137 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_panel_fitting@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_psr@psr-basic.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8032_full and XEIGTPW_11802_full:</p>
<h3>New IGT tests (155)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.49, 19.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [32.11, 69.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-x:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-6-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-x:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-6-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-2-x:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-6-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 2 pass(s)</li>
<li>Exec time: [10.47, 19.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.16, 5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11802_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_flip@blocking-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_flip@modeset-vs-vblank-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +109 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-4/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11802/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11802</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1977-0c981c182e22df4e1a25cd80f756b5824586e51e</li>
</ul>
<p>IGTPW_11802: 6814ac32e3f9c11f498855c3694a2ac640b127b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1977-0c981c182e22df4e1a25cd80f756b5824586e51e: 0c981c182e22df4e1a25cd80f756b5824586e51e</p>

</body>
</html>

--===============3811656907321884119==--
